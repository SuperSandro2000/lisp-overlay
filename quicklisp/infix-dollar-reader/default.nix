{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-infix-dollar-reader-src";
  inherit name rev sha256;
};
