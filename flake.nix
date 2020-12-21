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

        # str -> str -> { name = str; value = str; }
        fromKV = delim: s: let kv = nixpkgs.lib.splitString delim s; in {
          name = nixpkgs.lib.head kv;
          value = nixpkgs.lib.last kv;
        };

      in rec {

        # Throws: require file existence for clean errors.
        # { latest, version }
        subscription = if builtins.all builtins.pathExists [
          ./quicklisp/dist/quicklisp.txt
          ./quicklisp/dist/quicklisp-versions.txt
        ] then let
          latestFile = builtins.readFile ./quicklisp/dist/quicklisp.txt;
          versionsFile = builtins.readFile ./quicklisp/dist/quicklisp-versions.txt;
        in {
          latest = builtins.listToAttrs (
            builtins.map
              (fromKV ": ")
              (nixpkgs.lib.init (nixpkgs.lib.splitString "\n" latestFile))
          );
          versions = builtins.listToAttrs (
            builtins.map
              (fromKV " ")
              (nixpkgs.lib.init (nixpkgs.lib.splitString "\n" versionsFile))
          );
        } else builtins.throw "Run .#quicklisp-update-subscription first";

        # Raw distinfo data by dist
        # {
        #   "2020-10-14" = {
        #     archive-base-url = "http://archive.base.url/";
        #     canonical-distinfo-url = "http://canonical.distinfo.url/distinfo.txt";
        #     distinfo-subscription-url = "http://distinfo.subscription.url/quicklisp.txt";
        #     name = "quicklisp";
        #     release-index-url = "http://release.index.url/releases.txt";
        #     system-index-url = "http://system.index.url/systems.txt";
        #     version = "2020-10-14";
        #   };
        #   "2020-09-25" = ...;
        #   ...
        # }
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

        # Shortcut to latest dist's distinfo
        latestinfo = distinfos.${subscription.latest.version};

        # Basic package data by dist
        # {
        #   "2020-10-14" = {
        #     acclimation = {
        #       release = {
        #         content-sha1 = "0000000000000000000000000000000000000000";
        #         file-md5 = "00000000000000000000000000000000";
        #         prefix = "acclimation-someversion";
        #         project = "acclimation";
        #         size = "99999";
        #         systems-files = [ "acclimation-tests.asd" "acclimation.asd" ];
        #         url = "http://release.tarball.url/acclimation-someversion.tgz";
        #       };
        #       src.<platform> = <package-src: derivation>;
        #       systems = {
        #         acclimation = {
        #           dependencies = [ "asdf" ... ];
        #           project = "acclimation";
        #           system-file = "acclimation.asd";
        #           system-name = "acclimation";
        #         };
        #         acclimation-tests = {
        #           dependencies = [ "acclimation" "alexandria" ... ];
        #           project = "acclimation";
        #           system-file = "acclimation-tests.asd";
        #           system-name = "acclimation-tests";
        #         };
        #       };
        #     };
        #     alexandria = ...;
        #     ...
        #   };
        #   "2020-09-25" = ...;
        #   ...
        # }
        dists = builtins.mapAttrs (dist: path: let
          dir = ./quicklisp/dist + "/${dist}";

          releaseFile = let file = dir + "/releases.txt";
          in if builtins.pathExists file then builtins.readFile file else null;
          systemFile = let file = dir + "/systems.txt";
          in if builtins.pathExists file then builtins.readFile file else null;

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
            system-file = head (tail row) + ".asd";
            system-name = head (tail (tail row));
            dependencies = tail (tail (tail row));
          };

          releaseList = if releaseFile == null
          then builtins.trace "${dir}/releases.txt missing: run .#quicklisp-update-dists first" []
          else builtins.map readRelease (nixpkgs.lib.init releaseData);
          systemList = if systemFile == null
          then builtins.trace "${dir}/systems.txt missing: run .#quicklisp-update-dists first" []
          else builtins.map readSystems (nixpkgs.lib.init systemData);

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

        # Shortcut to latest dist
        latestdist = dists.${subscription.latest.version};

        # Projects with overrides applied, per dist
        # {
        #   "2020-10-14" = {
        #     acclimation.<platform> = {
        #       release = {
        #         content-sha1 = "0000000000000000000000000000000000000000";
        #         file-md5 = "00000000000000000000000000000000";
        #         prefix = "acclimation-someversion";
        #         project = "acclimation";
        #         size = "99999";
        #         systems-files = [ "acclimation-tests.asd" "acclimation.asd" ];
        #         url = "http://release.tarball.url/acclimation-someversion.tgz";
        #       };
        #       src = <package-src: derivation>;
        #       systems = {
        #         acclimation = {
        #           dependencies = [ "asdf" ... ];
        #           project = "acclimation";
        #           system-file = "acclimation.asd";
        #           system-name = "acclimation";
        #         };
        #         acclimation-tests = {
        #           dependencies = [ "acclimation" "alexandria" ... ];
        #           project = "acclimation";
        #           system-file = "acclimation-tests.asd";
        #           system-name = "acclimation-tests";
        #         };
        #       };
        #       libraries = [
        #         <pkgs.openssl: derivation>
        #       ];
        #       overrides = drv: {
        #         configurePhase = ''
        #           rm SomeFile
        #         '';
        #       };
        #     };
        #     alexandria.<platform> = ...;
        #     ...
        #   };
        #   "2020-09-25" = ...;
        #   ...
        # }
        projects = forAllPlatforms (platform: let
          pkgs = nixpkgs.legacyPackages.${platform};
          overrides = builtins.mapAttrs
            (file: _: nixpkgsOverride: import (./quicklisp/overrides + "/${file}") {
              inherit pkgs nixpkgsOverride;
            })
            (if builtins.pathExists ./quicklisp/overrides
             then builtins.readDir ./quicklisp/overrides
             else {});
          nixpkgsOverrideFor = project: let
            nixpkgsName = self.lib.nixpkgsNameFor project;
          in drv: drv // (pkgs.lispPackages.qlOverrides.${nixpkgsName} or (_: {})) drv;
        in builtins.mapAttrs (dist: builtins.mapAttrs (project: data:
          builtins.foldl' (acc: { predicate ? (_: true), override ? (x: x), correction ? (_: {}) }:
            if predicate { inherit dist; }
            then acc // correction acc // {
              overrides = drv: override (acc.overrides drv);
            } else acc
          ) ({
            inherit (data) release systems;
            src = data.src.${platform};
            libraries = [];
            overrides = drv: {};
          }) (let
            nixpkgsOverride = nixpkgsOverrideFor project;
            stub = { overrides = _: {}; };
          in (overrides."${project}.nix" or (nov: [nov])) {
            # Pilfer the parts we care about.
            correction = data: {
              libraries = (data.libraries or []) ++ ((nixpkgsOverride stub).propagatedBuildInputs or []);
            };
            override = drv: builtins.removeAttrs (((nixpkgsOverride stub).overrides or (x: {})) drv) ["propagatedBuildInputs"];
          })
        )) dists);

        # Shortcut to latest dist
        latestprojects = forAllPlatforms (platform: projects.${platform}.${subscription.latest.version});

        # System glossary (project lookup) by dist
        # {
        #   "2020-10-14" = {
        #     acclimation = [ "acclimation" ];
        #     acclimation-tests = [ "acclimation" ];
        #     alexandria = ...;
        #     ...
        #   };
        #   "2020-09-25" = ...;
        #   ...
        # }
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

        # Shortcut to latest dist's system glossary
        latestsystems = systems.${subscription.latest.version};
      };
    };

    legacyPackages = forAllPlatforms (platform: let
      pkgs = nixpkgs.legacyPackages.${platform};
    in builtins.mapAttrs (dist: set: builtins.mapAttrs (name: data: pkgs.lispPackages.buildLispPackage rec {
      baseName = data.release.project;
      version = nixpkgs.lib.removePrefix "${baseName}-" data.release.prefix;

      buildSystems = builtins.attrNames data.systems;

      description = "lisp-overlay package for ${baseName}";
      meta.build.systems = buildSystems;
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
      meta.deps.drvs = builtins.listToAttrs (builtins.map
        ({ project, system }: {
          name = system;
          value = self.packages.${platform}.${project}.systems.${system};
        })
        meta.deps.projects);
      deps = builtins.attrValues meta.deps.drvs;
      inherit (data) src;

      propagatedBuildInputs = data.libraries;

      packageName = nixpkgs.lib.strings.sanitizeDerivationName baseName;

      asdFilesToKeep = data.release.systems-files;

      overrides = outerDrv: data.overrides outerDrv // {
        passthru.overrides = outerDrv;
        passthru.systems = builtins.mapAttrs (systemName: system:
          pkgs.lispPackages.buildLispPackage rec {
            overrides = innerDrv: data.overrides innerDrv //  {
              name = "${innerDrv.name}-${nixpkgs.lib.strings.sanitizeDerivationName systemName}";
            };
            inherit baseName version description src packageName asdFilesToKeep propagatedBuildInputs;
            buildSystems = [systemName];
            meta.build.systems = buildSystems;
            meta.deps.systems = system.dependencies;
            meta.deps.projects = nixpkgs.lib.remove null (builtins.map
              (system: let # Take the first in the case of a collision
                projects = self.repos.quicklisp.systems.${dist}.${system} or null;
                project = if builtins.isNull projects
                  then builtins.trace "dropped missing dependency '${dist}'.'${system}' for '${baseName}'" null
                  else builtins.head projects;
              in if project != null && project != name then { inherit project system; } else null)
              (nixpkgs.lib.remove "asdf" meta.deps.systems));
            meta.deps.drvs = builtins.listToAttrs (builtins.map
              ({ project, system }: {
                name = system;
                value = self.legacyPackages.${platform}.${dist}.${project}.systems.${system};
              })
              meta.deps.projects);
            deps = builtins.attrValues meta.deps.drvs;
          }
        ) data.systems;
      };
    }) set // {
      inherit (pkgs) asdf;
      lispPackages = pkgs.lispPackages // (let
        overlay = builtins.listToAttrs (builtins.map
          (project: {
            name = self.lib.nixpkgsNameFor project;
            value = self.legacyPackages.${platform}.${dist}.${project};
          })
          (builtins.attrNames set)
        );
      in import "${inputs.nixpkgs.outPath}/pkgs/development/lisp-modules/lisp-packages.nix" {
        inherit (pkgs) stdenv sbcl coreutils nix asdf;
        inherit (pkgs.lispPackages) clwrapper;
        pkgs = pkgs // {
          lispPackages = self.legacyPackages.${platform}.${dist}.lispPackages;
        };
      });
    }) self.repos.quicklisp.projects.${platform});

    packages = forAllPlatforms (platform: let
      pkgs = nixpkgs.legacyPackages.${platform};
    in self.legacyPackages.${platform}.${self.repos.quicklisp.subscription.latest.version} or {});

    overlays = builtins.mapAttrs (dist: _: (
      final: prev: {
        inherit (self.legacyPackages.${final.system}.${dist}) lispPackages;
      }
    )) self.repos.quicklisp.dists;

    overlay = self.overlays.${self.repos.quicklisp.subscription.latest.version};

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
            url = self.repos.quicklisp.subscription.versions.${dist};
            message = "quicklisp: add/update distinfo for ${dist}";
          in ''
            ${pkgs.coreutils}/bin/mkdir -p quicklisp/dist/${dist}
            ${pkgs.curl}/bin/curl -L '${url}' > quicklisp/dist/${dist}/distinfo.txt
            ${pkgs.git}/bin/git add quicklisp/dist/${dist}/distinfo.txt && \
            ${pkgs.git}/bin/git commit -m '${message}' -- \
              quicklisp/dist/${dist}/distinfo.txt \
              || true
          '') (builtins.attrNames self.repos.quicklisp.subscription.versions)}

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
      nixpkgsNameFor = project: let
        escapes = {
          "/" = "_slash_";
          "\\" = "_backslash_";
          "_" = "__";
          "." = "_dot_";
          "+" = "_plus_";
        };
        cleanedStr = builtins.replaceStrings (builtins.attrNames escapes) (builtins.attrValues escapes) project;
      in if builtins.isNull (builtins.match "^[a-zA-Z_].*" cleanedStr) then "_${cleanedStr}" else cleanedStr;
    };

  };
}
