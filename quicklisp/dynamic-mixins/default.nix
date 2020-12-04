{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-dynamic-mixins-src";
  inherit name rev sha256;
};
