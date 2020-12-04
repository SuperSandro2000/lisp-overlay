{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-physical-quantities-src";
  inherit name rev sha256;
};
