{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-floating-point-contractions-src";
  inherit name rev sha256;
};
