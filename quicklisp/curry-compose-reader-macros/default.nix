{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-curry-compose-reader-macros-src";
  inherit name rev sha256;
};
