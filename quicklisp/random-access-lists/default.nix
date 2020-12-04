{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-random-access-lists-src";
  inherit name rev sha256;
};
