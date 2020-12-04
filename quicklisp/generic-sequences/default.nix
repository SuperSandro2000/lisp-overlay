{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-generic-sequences-src";
  inherit name rev sha256;
};
