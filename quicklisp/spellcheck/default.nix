{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-spellcheck-src";
  inherit name rev sha256;
};
