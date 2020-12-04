{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-check-bnf-src";
  inherit name rev sha256;
};
