{
  description = "Extremely zealous lisp overlay";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = inputs@{ self, nixpkgs }: let
    forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "i686-linux" "aarch64-linux" ];
  in {

    repos = {
      quicklisp = rec {
        # ohoho use  http://beta.quicklisp.org/dist/quicklisp.txt  and
        #            http://beta.quicklisp.org/dist/quicklisp-versions.txt  ?

        latest = let inherit (nixpkgs) lib; in builtins.listToAttrs (
          builtins.map
            (s: let kv = lib.splitString ": " s; in { name = lib.head kv; value = lib.last kv; })
            (lib.init (lib.splitString "\n" (builtins.readFile (builtins.fetchurl { url = "http://beta.quicklisp.org/dist/quicklisp.txt"; }))))
        );

        # Quicklisp dist attrset
        dists = let
          filldist = value@{ name, ... }: (nixpkgs.lib.genAttrs
            ["systems" "releases" "distinfo"] (file:
              "http://beta.quicklisp.org/dist/quicklisp/${name}/${file}.txt"
            )
          ) // value;
          distlist = builtins.map (entry: let
            value = filldist entry;
          in {
            inherit (value) name;
            inherit value;
          }) (builtins.fromJSON (builtins.readFile ./quicklisp/dists.json));
        in builtins.listToAttrs distlist // {
          latest = (builtins.head distlist).value;
        };

        # Filename to url mapping
        archives = let
          filespecs = builtins.concatLists (builtins.attrValues dists);
        in builtins.listToAttrs (builtins.map ({ name, url, ... }: {
          name = name;
          value = url;
        }) filespecs);

        # Repository dist pin
        meta = builtins.fromJSON (builtins.readFile ./quicklisp/meta.json);

        # Quicklisp dist fetch
        dist = forAllSystems (system: let
          pkgs = nixpkgs.legacyPackages.${system};
        in pkgs.fetchgit {
          inherit (self.repos.quicklisp.meta) url rev sha256;
        });

        # Package specs
        specs = forAllSystems (system: builtins.mapAttrs
          (name: _: let
            value = nixpkgs.lib.removeSuffix "\n" (
              builtins.readFile "${dist.${system}}/projects/${name}/source.txt"
            );
            kvPair = nixpkgs.lib.splitString " " value;
          in {
            type = nixpkgs.lib.elemAt kvPair 0;
            url = nixpkgs.lib.elemAt kvPair 1;
            data = if builtins.length kvPair > 2
                   then nixpkgs.lib.elemAt kvPair 2
                   else null;
            inherit value;
          })
          (builtins.readDir "${dist.${system}}/projects"));

        # Package updater script snippets
        updaters = forAllSystems (system: let
          pkgs = nixpkgs.legacyPackages.${system};
        in builtins.mapAttrs
          (name: { type, url, ... }: let
            inherit (self.lib.quicklisp) handler;
          in if builtins.hasAttr type handler then handler.${type} { inherit name url pkgs; }
             else builtins.trace "Quicklisp - Unhandled type: ${type} (for ${name})" null)
          (specs.${system})
        );

        # Enumeration of valid "type" values, just to eval
        types = forAllSystems (system: nixpkgs.lib.unique (
          nixpkgs.lib.mapAttrsToList (k: v: v.type) specs.${system}
        ));
      };
    };

    packages = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    });

    defaultPackage = forAllSystems (system: self.packages.${system}.dists.quicklisp);

    apps = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (nixpkgs.lib) concatStringsSep mapAttrsToList;
    in {
      quicklisp-update-dists = rec {
        type = "app";
        url = "https://api.github.com/repos/roswell/quicklisp/releases?page=";
        program = (pkgs.writeShellScript "update-quicklisp-dist" ''set -ex
          test -e flake.nix || (echo "Must be run from repo root"; exit 1)
          ${pkgs.coreutils}/bin/mkdir -p quicklisp

          while
            ${pkgs.curl}/bin/curl -L "${url}''${page:-1}" \
              | ${pkgs.jq}/bin/jq -e 'select(length != 0)' \
              > quicklisp/.dists.''${page:-1}.json
          do
            page=$((''${page:-1}+1))
          done

          ${pkgs.coreutils}/bin/rm quicklisp/.dists.json
          for ((p=1; p<$page; p++)); do
            ${pkgs.coreutils}/bin/cat quicklisp/.dists.$p.json \
              >> quicklisp/.dists.json
          done

          ${pkgs.jq}/bin/jq -s '[.[][]] | map({ name: .tag_name, files: .assets | map({ name: .name, id: .id, url: .browser_download_url }) })' quicklisp/.dists.json \
            > quicklisp/dists.json
        '').outPath;
      };
      quicklisp-update-dist = rec {
        type = "app";
        url = "git://github.com/quicklisp/quicklisp-projects";
        program = (pkgs.writeShellScript "update-quicklisp-dist" ''set -ex
          test -e flake.nix || (echo "Must be run from repo root"; exit 1)
          mkdir -p quicklisp
          ${pkgs.nix-prefetch-git}/bin/nix-prefetch-git --url '${url}' > quicklisp/meta.json
        '').outPath;
      };
      quicklisp-update-pkgs = rec {
        type = "app";
        updaters = self.repos.quicklisp.updaters.${system};
        program = (pkgs.writeShellScript "update-quicklisp-pkgs" ''set -ex
          test -e flake.nix || (echo "Must be run from repo root"; exit 1)
          mkdir -p quicklisp && cd quicklisp
          ${concatStringsSep "" (mapAttrsToList (name: updater: ''
            echo -- ${name}
            ${if updater != null then updater else "echo Unavailable"}
          '') updaters)}
        '').outPath;
      };
      quicklisp-add-pkgs = rec {
        type = "app";
        updaters = self.repos.quicklisp.updaters.${system};
        program = (pkgs.writeShellScript "update-quicklisp-pkgs" ''set -ex
          test -e flake.nix || (echo "Must be run from repo root"; exit 1)
          mkdir -p quicklisp && cd quicklisp
          ${concatStringsSep "" (mapAttrsToList (name: updater: ''
            echo -- ${name}
            if test ! -e ${name}; then
              ${if updater != null then updater else "echo Unavailable"}
            fi
          '') updaters)}
        '').outPath;
      };
    });

    lib = {
      quicklisp = rec {
        handler.git = { name, url, pkgs, ... }: let
          buildScript = pkgs.writeText "quicklisp-${name}-fetch" ''
            { pkgs, ... }: let
              meta = builtins.readFile ./meta.json;
            in pkgs.fetchgit {
              name = "quicklisp-${name}-src";
              inherit (meta) url rev sha256;
            };
          '';
        in pkgs.writeShellScript "quicklisp-${name}" ''
          mkdir -p ${name}
          ${pkgs.nix-prefetch-git}/bin/nix-prefetch-git --url '${url}' > ${name}/meta.json
          cp ${buildScript} ${name}/default.nix
        '';
        handler.mercurial = { name, url, pkgs, ... }: let
          buildScript = pkgs.writeText "quicklisp-${name}-fetch" ''
            { pkgs, ... }: let
              sha256 = builtins.readFile ./meta.hash;
            in builtins.fetchMercurial {
              url = "${url}";
              inherit sha256;
            };
          '';
        in pkgs.writeShellScript "quicklisp-${name}" ''
          mkdir -p ${name}
          ${pkgs.nix-prefetch-hg}/bin/nix-prefetch-hg --url '${url}' > ${name}/meta.hash
          cp ${buildScript} ${name}/default.nix
        '';
        handler.https = { name, url, pkgs, ... }: let
          buildScript = pkgs.writeText "quicklisp-${name}-fetch" ''
            { pkgs, ... }: let
              sha256 = builtins.readFile ./meta.hash;
            in builtins.fetchTarball {
              url = "${url}";
              inherit sha256;
            };
          '';
        in pkgs.writeShellScript "quicklisp-${name}" ''
          mkdir -p ${name}
          ${pkgs.nix}/bin/nix-prefetch-url --unpack '${url}' > ${name}/meta.hash
          cp ${buildScript} ${name}/default.nix
        '';
        handler.http = handler.https;
        handler.latest-github-tag = handler.git; # Maybe should handle this better
        handler.latest-github-release = handler.git; # Maybe should handle this better
        handler.tagged-git = handler.git; # Maybe should handle this better
        handler.svn = { name, url, pkgs, ... }: let
          buildScript = pkgs.writeText "quicklisp-${name}-fetch" ''
            { pkgs, ... }: let
              sha256 = builtins.readFile ./meta.hash;
            in pkgs.fetchsvn {
              url = "${url}";
              inherit sha256;
            };
          '';
        in pkgs.writeShellScript "quicklisp-${name}" ''
          mkdir -p ${name}
          ${pkgs.nix-prefetch-svn}/bin/nix-prefetch-svn '${url}' > ${name}/meta.hash
          cp ${buildScript} ${name}/default.nix
        '';
       #handler.darcs = null;
       #handler.branched-git = null;
       #handler.ediware-http = null;
       #handler.kmr-git = null;
       #handler.single-file = null;
      };
    };

  };
}
