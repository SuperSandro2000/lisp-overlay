{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-py-configvalidator-src";
  inherit name rev sha256;
};
