{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-quakeinfo-src";
  inherit name rev sha256;
};
