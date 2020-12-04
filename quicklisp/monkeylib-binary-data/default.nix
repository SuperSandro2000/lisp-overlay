{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-monkeylib-binary-data-src";
  inherit name rev sha256;
};
