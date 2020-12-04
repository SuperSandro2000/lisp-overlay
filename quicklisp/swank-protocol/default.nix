{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-swank-protocol-src";
  inherit name rev sha256;
};
