{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-crypto-shortcuts-src";
  inherit name rev sha256;
};
