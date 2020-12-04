{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-opticl-core-src";
  inherit name rev sha256;
};
