{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-with-c-syntax-src";
  inherit name rev sha256;
};
