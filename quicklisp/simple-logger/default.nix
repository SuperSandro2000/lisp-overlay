{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-simple-logger-src";
  inherit name rev sha256;
};
