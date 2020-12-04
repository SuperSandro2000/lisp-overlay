{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-unit-formula-src";
  inherit name rev sha256;
};
