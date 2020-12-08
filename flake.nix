{
  description = "Extremely zealous lisp overlay";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = inputs@{ self, nixpkgs }: let

    forAllPlatforms = nixpkgs.lib.genAttrs [ "x86_64-linux" "i686-linux" "aarch64-linux" ];

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
          projects = builtins.attrNames releaseAttrs;
          systemAttrs = builtins.listToAttrs (builtins.map (name: {
            inherit name;
            value = builtins.filter (system: system.project == name) systemList;
          }) projects);
        in builtins.listToAttrs (
          builtins.map (name: {
            inherit name;
            value = rec {
              release = releaseAttrs.${name};
              systems = builtins.listToAttrs (builtins.map (value: {
                name = value.system-name;
                inherit value;
              }) systemAttrs.${name});
              src = forAllPlatforms (platform: let
                pkgs = nixpkgs.legacyPackages.${platform};
              in (pkgs.fetchurl {
                inherit (release) url;
                hash = release.file-md5;
              }).overrideAttrs (_: {
                # We'll just force this, cause nixpkgs won't let us do it nicely
                outputHashAlgo = "md5";
              }));
            };
          }) projects
        )) distinfos;

        latestdist = dists.${latest.version};

        systems = let
          distProjectSystems = builtins.mapAttrs (_: builtins.mapAttrs (_: p:
            builtins.attrValues (builtins.mapAttrs (_: s: s.system-name) p.systems)
          )) dists;
        in builtins.mapAttrs (_: projectSystems: let
          systemDefs = builtins.mapAttrs (project:
            builtins.map (system: { inherit project system; })
          ) projectSystems;
          systemPairs = builtins.concatLists (builtins.attrValues systemDefs);
          systemNames = builtins.listToAttrs (builtins.map (p: {
            name = p.system;
            value = [];
          }) systemPairs);
        in builtins.mapAttrs (system: _:
          # Defined as a list, in case multiple projects ever define a system
          builtins.map (p: p.project) (builtins.filter (p: p.system == system) systemPairs)
        ) systemNames) distProjectSystems;

        latestsystems = systems.${latest.version};
      };
    };

    legacyPackages = forAllPlatforms (platform: let
      pkgs = nixpkgs.legacyPackages.${platform};
    in builtins.mapAttrs (dist: builtins.mapAttrs (name: data: pkgs.lispPackages.buildLispPackage rec {
      baseName = data.release.project;
      version = nixpkgs.lib.removePrefix "${baseName}-" data.release.prefix;

      buildSystems = builtins.attrNames data.systems;

      description = "lisp-overlay package for ${baseName}";
      meta.deps.systems = builtins.concatLists (builtins.map
        (system: system.dependencies)
        (builtins.attrValues data.systems));
      meta.deps.projects = nixpkgs.lib.remove null (builtins.map
        (system: let # Take the first in the case of a collision
          projects = self.repos.quicklisp.systems.${dist}.${system} or null;
          project = if builtins.isNull projects
            then builtins.trace "dropped missing dependency '${system}' for '${baseName}'" null
            else builtins.head projects;
        in if project != null && project != name then { inherit project system; } else null)
        (nixpkgs.lib.remove "asdf" meta.deps.systems));
      deps = builtins.map
        ({ project, system }: self.packages.${platform}.${project}.systems.${system})
        meta.deps.projects;
      src = data.src.${platform};

      packageName = nixpkgs.lib.strings.sanitizeDerivationName baseName;

      asdFilesToKeep = data.release.systems-files;

      overrides = _: {
        passthru.systems = builtins.mapAttrs (systemName: system: pkgs.lispPackages.buildLispPackage rec {
          overrides = drv: { name = "${drv.name}-${nixpkgs.lib.strings.sanitizeDerivationName systemName}"; };
          inherit baseName version description src packageName asdFilesToKeep;
          buildSystems = [systemName];
          meta.deps.systems = system.dependencies;
          meta.deps.projects = nixpkgs.lib.remove null (builtins.map
            (system: let # Take the first in the case of a collision
              projects = self.repos.quicklisp.systems.${dist}.${system} or null;
              project = if builtins.isNull projects
                then builtins.trace "dropped missing dependency '${system}' for '${baseName}'" null
                else builtins.head projects;
            in if project != null && project != name then { inherit project system; } else null)
            (nixpkgs.lib.remove "asdf" meta.deps.systems));
          deps = builtins.map
            ({ project, system }: self.packages.${platform}.${project}.systems.${system})
            meta.deps.projects;
        }) data.systems;
      };
    })) self.repos.quicklisp.dists // {
      inherit (pkgs) asdf;
    });

    packages = forAllPlatforms (platform: let
      pkgs = nixpkgs.legacyPackages.${platform};
    in self.legacyPackages.${platform}.${self.repos.quicklisp.latest.version});

    apps = forAllPlatforms (platform: let
      pkgs = nixpkgs.legacyPackages.${platform};
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

    lib = {};

  };
}
