{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-skippy-renderer-src";
  inherit name rev sha256;
};
