{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-perceptual-hashes-src";
  inherit name rev sha256;
};
