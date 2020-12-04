{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-custom-hash-table-src";
  inherit name rev sha256;
};
