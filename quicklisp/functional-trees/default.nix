{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-functional-trees-src";
  inherit name rev sha256;
};
