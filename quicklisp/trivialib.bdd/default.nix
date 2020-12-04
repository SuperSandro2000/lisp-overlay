{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-trivialib.bdd-src";
  inherit name rev sha256;
};
