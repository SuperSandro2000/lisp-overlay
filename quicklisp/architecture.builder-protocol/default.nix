{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-architecture.builder-protocol-src";
  inherit name rev sha256;
};
