{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-monkeylib-parser-src";
  inherit name rev sha256;
};
