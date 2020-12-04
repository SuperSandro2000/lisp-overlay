{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-esrap-liquid-src";
  inherit name rev sha256;
};
