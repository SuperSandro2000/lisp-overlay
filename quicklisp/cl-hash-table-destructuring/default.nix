{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-hash-table-destructuring-src";
  inherit name rev sha256;
};
