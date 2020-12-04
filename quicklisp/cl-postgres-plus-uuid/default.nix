{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-postgres-plus-uuid-src";
  inherit name rev sha256;
};
