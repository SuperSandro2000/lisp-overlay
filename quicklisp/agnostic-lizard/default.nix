{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-agnostic-lizard-src";
  inherit name rev sha256;
};
