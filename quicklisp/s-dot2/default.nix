{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-s-dot2-src";
  inherit name rev sha256;
};
