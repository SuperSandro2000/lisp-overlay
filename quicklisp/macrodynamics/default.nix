{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-macrodynamics-src";
  inherit name rev sha256;
};
