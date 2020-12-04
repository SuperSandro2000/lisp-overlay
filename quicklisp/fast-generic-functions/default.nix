{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-fast-generic-functions-src";
  inherit name rev sha256;
};
