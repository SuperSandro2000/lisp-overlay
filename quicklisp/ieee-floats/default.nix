{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-ieee-floats-src";
  inherit name rev sha256;
};
