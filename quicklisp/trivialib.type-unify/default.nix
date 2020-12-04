{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-trivialib.type-unify-src";
  inherit name rev sha256;
};
