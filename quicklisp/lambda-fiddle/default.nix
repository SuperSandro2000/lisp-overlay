{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-lambda-fiddle-src";
  inherit name rev sha256;
};
