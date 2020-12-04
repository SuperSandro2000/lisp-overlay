{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-architecture.hooks-src";
  inherit name rev sha256;
};
