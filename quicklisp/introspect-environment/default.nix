{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-introspect-environment-src";
  inherit name rev sha256;
};
