{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-matrix-case-src";
  inherit name rev sha256;
};
