{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-draw-cons-tree-src";
  inherit name rev sha256;
};
