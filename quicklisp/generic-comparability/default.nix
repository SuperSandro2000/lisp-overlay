{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-generic-comparability-src";
  inherit name rev sha256;
};
