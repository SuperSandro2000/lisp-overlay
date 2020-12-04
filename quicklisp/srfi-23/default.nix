{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-srfi-23-src";
  inherit name rev sha256;
};
