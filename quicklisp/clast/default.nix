{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-clast-src";
  inherit name rev sha256;
};