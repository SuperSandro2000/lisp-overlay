{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-docbrowser-src";
  inherit name rev sha256;
};
