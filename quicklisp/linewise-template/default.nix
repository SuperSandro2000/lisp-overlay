{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-linewise-template-src";
  inherit name rev sha256;
};
