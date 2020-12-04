{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-codata-recommended-values-src";
  inherit name rev sha256;
};
