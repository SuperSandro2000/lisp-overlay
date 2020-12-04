{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-3b-bmfont-src";
  inherit name rev sha256;
};
