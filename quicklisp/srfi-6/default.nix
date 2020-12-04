{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-srfi-6-src";
  inherit name rev sha256;
};
