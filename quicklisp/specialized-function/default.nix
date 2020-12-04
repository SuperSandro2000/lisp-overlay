{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-specialized-function-src";
  inherit name rev sha256;
};
