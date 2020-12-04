{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-command-line-arguments-src";
  inherit name rev sha256;
};
