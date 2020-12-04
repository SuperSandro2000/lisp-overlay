{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-s-graphviz-src";
  inherit name rev sha256;
};
