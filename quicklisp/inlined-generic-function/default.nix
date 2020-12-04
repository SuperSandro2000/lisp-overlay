{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-inlined-generic-function-src";
  inherit name rev sha256;
};
