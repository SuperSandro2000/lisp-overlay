{ ... }:

let
  flake-compat = import (fetchTarball https://github.com/edolstra/flake-compat/archive/master.tar.gz);
  flake = flake-compat { src = ./.; };
  maybe = c: let result = builtins.tryEval c; in if result.success then result.value else {};
in { inherit flake-compat flake; self = flake.defaultNix; }
// maybe flake.defaultNix
// maybe flake.defaultNix.repos
// maybe flake.defaultNix.legacyPackages
// maybe flake.defaultNix.legacyPackages.${builtins.currentSystem}
// maybe flake.defaultNix.packages.${builtins.currentSystem}
