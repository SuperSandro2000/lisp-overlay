{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-ia-hash-table-src";
  inherit name rev sha256;
};
