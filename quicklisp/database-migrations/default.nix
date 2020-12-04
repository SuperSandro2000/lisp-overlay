{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-database-migrations-src";
  inherit name rev sha256;
};
