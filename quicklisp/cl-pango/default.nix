{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-pango-src";
  inherit name rev sha256;
};