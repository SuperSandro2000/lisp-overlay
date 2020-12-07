{
  description = "Extremely zealous lisp overlay";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = inputs@{ self, nixpkgs }: let

    forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "i686-linux" "aarch64-linux" ];

    urls.quicklisp = {
      latest = "http://beta.quicklisp.org/dist/quicklisp.txt";
      versions = "http://beta.quicklisp.org/dist/quicklisp-versions.txt";
    };

  in {

    repos = {
      quicklisp = let
        fromKV = delim: s: let kv = nixpkgs.lib.splitString delim s; in {
          name = nixpkgs.lib.head kv;
          value = nixpkgs.lib.last kv;
        };
      in rec {
        subscription = if builtins.all builtins.pathExists [
          ./quicklisp/dist/quicklisp.txt
          ./quicklisp/dist/quicklisp-versions.txt
        ] then {
          latest = builtins.readFile ./quicklisp/dist/quicklisp.txt;
          versions = builtins.readFile ./quicklisp/dist/quicklisp-versions.txt;
        } else builtins.throw "Run .#quicklisp-update-subscription first";

        latest = builtins.listToAttrs (
          builtins.map
            (fromKV ": ")
            (nixpkgs.lib.init (nixpkgs.lib.splitString "\n" subscription.latest))
        );

        versions = builtins.listToAttrs (
          builtins.map
            (fromKV " ")
            (nixpkgs.lib.init (nixpkgs.lib.splitString "\n" subscription.versions))
        );

        distinfos = let
          files = nixpkgs.lib.filterAttrs (dist: builtins.pathExists) (
            builtins.mapAttrs
              (dist: _: ./quicklisp/dist + "/${dist}/distinfo.txt")
              (builtins.readDir ./quicklisp/dist));
          parse = ss: builtins.listToAttrs (
            builtins.map
              (fromKV ": ")
              (nixpkgs.lib.init (nixpkgs.lib.splitString "\n" ss)));
        in builtins.mapAttrs (dist: path: parse (builtins.readFile path)) files;

        latestinfo = distinfos.${latest.version};

        dists = let
          _ = _;
        in builtins.mapAttrs (dist: path: let
          dir = if builtins.all builtins.pathExists [
            (./quicklisp/dist + "/${dist}/releases.txt")
            (./quicklisp/dist + "/${dist}/systems.txt")
          ] then ./quicklisp/dist + "/${dist}"
            else builtins.throw "Run .#quicklisp-update-dists first";

          releaseFile = builtins.readFile (dir + "/releases.txt");
          systemFile = builtins.readFile (dir + "/systems.txt");

          releaseData = builtins.tail (nixpkgs.lib.splitString "\n" releaseFile);
          systemData = builtins.tail (nixpkgs.lib.splitString "\n" systemFile);

          readRelease = s: let
            # project url size file-md5 content-sha1 prefix [system-file1..system-fileN]",
            row = nixpkgs.lib.splitString " " s;
            inherit (builtins) head tail;
          in {
            project = head row;
            url = head (tail row);
            size = head (tail (tail row));
            file-md5 = head (tail (tail (tail row)));
            content-sha1 = head (tail (tail (tail (tail row))));
            prefix = head (tail (tail (tail (tail (tail row)))));
            systems-files = tail (tail (tail (tail (tail (tail row)))));
          };
          readSystems = s: let
            # project system-file system-name [dependency1..dependencyN]",
            row = nixpkgs.lib.splitString " " s;
            inherit (builtins) head tail;
          in {
            project = head row;
            system-file = head (tail row);
            system-name = head (tail (tail row));
            dependencies = tail (tail (tail row));
          };

          releaseList = builtins.map readRelease (nixpkgs.lib.init releaseData);
          systemList = builtins.map readSystems (nixpkgs.lib.init systemData);

          releaseAttrs = builtins.listToAttrs (builtins.map (value: {
            name = value.project;
            inherit value;
          }) releaseList);
          systemAttrs = builtins.listToAttrs (builtins.map (value: {
            name = value.project;
            inherit value;
          }) systemList);
          projects = nixpkgs.lib.unique (builtins.concatLists [
            (builtins.attrNames releaseAttrs)
            (builtins.attrNames systemAttrs)
          ]);
        in builtins.listToAttrs (
          builtins.map (name: {
            inherit name;
            value = {
              release = releaseAttrs.${name};
              systems = systemAttrs.${name};
            };
          }) projects
        )) distinfos;

        latestdist = dists.${latest.version};
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
      quicklisp-update-subscription = rec {
        type = "app";
        message = "quicklisp: update subscription";
        program = (pkgs.writeShellScript "update-quicklisp-subscription" ''set -ex
          test -e flake.nix || (echo "Must be run from repo root"; exit 1)
          ${pkgs.coreutils}/bin/mkdir -p quicklisp/dist

          ${pkgs.curl}/bin/curl -L '${urls.quicklisp.latest}' > quicklisp/dist/quicklisp.txt
          ${pkgs.curl}/bin/curl -L '${urls.quicklisp.versions}' > quicklisp/dist/quicklisp-versions.txt
          ${pkgs.git}/bin/git add \
            quicklisp/dist/quicklisp.txt quicklisp/dist/quicklisp-versions.txt \
          && ${pkgs.git}/bin/git commit -m '${message}' -- \
            quicklisp/dist/quicklisp.txt quicklisp/dist/quicklisp-versions.txt \
            || true

          echo Done.
        '').outPath;
      };

      quicklisp-update-distinfos = rec {
        type = "app";
        program = (pkgs.writeShellScript "update-quicklisp-distinfos" ''set -ex
          test -e flake.nix || (echo "Must be run from repo root"; exit 1)

          ${nixpkgs.lib.concatMapStringsSep "" (dist: let
            url = self.repos.quicklisp.versions.${dist};
            message = "quicklisp: add/update distinfo for ${dist}";
          in ''
            ${pkgs.coreutils}/bin/mkdir -p quicklisp/dist/${dist}
            ${pkgs.curl}/bin/curl -L '${url}' > quicklisp/dist/${dist}/distinfo.txt
            ${pkgs.git}/bin/git add quicklisp/dist/${dist}/distinfo.txt && \
            ${pkgs.git}/bin/git commit -m '${message}' -- \
              quicklisp/dist/${dist}/distinfo.txt \
              || true
          '') (builtins.attrNames self.repos.quicklisp.versions)}

          echo Done.
        '').outPath;
      };

      quicklisp-update-dists = rec {
        type = "app";
        program = (pkgs.writeShellScript "update-quicklisp-dists" ''set -ex
          test -e flake.nix || (echo "Must be run from repo root"; exit 1)

          ${nixpkgs.lib.concatMapStringsSep "" (dist: let
            distinfo = self.repos.quicklisp.distinfos.${dist};
            message = "quicklisp: update dist indices for ${dist}";
          in ''
            ${pkgs.curl}/bin/curl -L '${distinfo.release-index-url}' > quicklisp/dist/${dist}/releases.txt
            ${pkgs.curl}/bin/curl -L '${distinfo.system-index-url}' > quicklisp/dist/${dist}/systems.txt
            ${pkgs.git}/bin/git add \
              quicklisp/dist/${dist}/releases.txt quicklisp/dist/${dist}/systems.txt && \
            ${pkgs.git}/bin/git commit -m '${message}' -- \
              quicklisp/dist/${dist}/releases.txt quicklisp/dist/${dist}/systems.txt \
              || true
          '') (builtins.attrNames self.repos.quicklisp.distinfos)}

          echo Done.
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
