{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-s-sysdeps-src";
  inherit name rev sha256;
};
