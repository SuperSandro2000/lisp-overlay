{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-defpackage-plus-src";
  inherit name rev sha256;
};
