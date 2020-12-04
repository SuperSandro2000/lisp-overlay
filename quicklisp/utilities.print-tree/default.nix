{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-utilities.print-tree-src";
  inherit name rev sha256;
};
