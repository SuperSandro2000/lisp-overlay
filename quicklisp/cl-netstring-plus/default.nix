{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-netstring-plus-src";
  inherit name rev sha256;
};
