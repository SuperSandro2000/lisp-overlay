{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-gtirb-capstone-src";
  inherit name rev sha256;
};
