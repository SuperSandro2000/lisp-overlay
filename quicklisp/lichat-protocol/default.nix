{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-lichat-protocol-src";
  inherit name rev sha256;
};
