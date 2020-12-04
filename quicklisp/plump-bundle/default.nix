{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-plump-bundle-src";
  inherit name rev sha256;
};
