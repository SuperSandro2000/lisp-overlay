{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-srfi-1-src";
  inherit name rev sha256;
};
