{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-arrow-macros-src";
  inherit name rev sha256;
};
