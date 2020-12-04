{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-monkeylib-text-languages-src";
  inherit name rev sha256;
};
