{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-xhtmlambda-src";
  inherit name rev sha256;
};
