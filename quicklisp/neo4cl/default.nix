{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-neo4cl-src";
  inherit name rev sha256;
};
