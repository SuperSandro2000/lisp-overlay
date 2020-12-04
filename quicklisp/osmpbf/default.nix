{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-osmpbf-src";
  inherit name rev sha256;
};
