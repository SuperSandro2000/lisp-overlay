{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-persistent-tables-src";
  inherit name rev sha256;
};
