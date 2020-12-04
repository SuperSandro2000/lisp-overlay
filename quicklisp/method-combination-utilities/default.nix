{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-method-combination-utilities-src";
  inherit name rev sha256;
};
