{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-weblocks-tree-widget-src";
  inherit name rev sha256;
};
