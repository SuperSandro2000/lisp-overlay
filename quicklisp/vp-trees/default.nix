{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-vp-trees-src";
  inherit name rev sha256;
};
