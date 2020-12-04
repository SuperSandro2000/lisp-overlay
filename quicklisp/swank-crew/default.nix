{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-swank-crew-src";
  inherit name rev sha256;
};
