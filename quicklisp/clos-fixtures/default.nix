{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-clos-fixtures-src";
  inherit name rev sha256;
};
