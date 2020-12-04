{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-spatial-trees-src";
  inherit name rev sha256;
};
