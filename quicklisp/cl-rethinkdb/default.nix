{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-rethinkdb-src";
  inherit name rev sha256;
};
