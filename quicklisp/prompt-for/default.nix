{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-prompt-for-src";
  inherit name rev sha256;
};
