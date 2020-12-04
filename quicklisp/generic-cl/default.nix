{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-generic-cl-src";
  inherit name rev sha256;
};
