{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-advanced-readtable-src";
  inherit name rev sha256;
};
