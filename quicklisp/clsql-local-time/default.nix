{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-clsql-local-time-src";
  inherit name rev sha256;
};
