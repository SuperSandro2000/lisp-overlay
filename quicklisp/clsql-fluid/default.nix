{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-clsql-fluid-src";
  inherit name rev sha256;
};
