{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-structure-ext-src";
  inherit name rev sha256;
};
