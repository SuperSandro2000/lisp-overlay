{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-esrap-peg-src";
  inherit name rev sha256;
};
