{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-performance-tuning-helper-src";
  inherit name rev sha256;
};