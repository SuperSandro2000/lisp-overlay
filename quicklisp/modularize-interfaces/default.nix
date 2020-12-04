{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-modularize-interfaces-src";
  inherit name rev sha256;
};
