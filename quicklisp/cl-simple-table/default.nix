{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-simple-table-src";
  inherit name rev sha256;
};