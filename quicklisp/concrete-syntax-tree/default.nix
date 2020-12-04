{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-concrete-syntax-tree-src";
  inherit name rev sha256;
};
