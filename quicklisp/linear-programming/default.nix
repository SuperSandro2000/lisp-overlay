{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-linear-programming-src";
  inherit name rev sha256;
};
