{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-retrospectiff-src";
  inherit name rev sha256;
};
