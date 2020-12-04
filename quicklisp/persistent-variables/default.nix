{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-persistent-variables-src";
  inherit name rev sha256;
};
