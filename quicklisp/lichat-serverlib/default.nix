{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-lichat-serverlib-src";
  inherit name rev sha256;
};
