{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-a-cl-logger-src";
  inherit name rev sha256;
};
