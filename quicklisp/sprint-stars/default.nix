{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-sprint-stars-src";
  inherit name rev sha256;
};
