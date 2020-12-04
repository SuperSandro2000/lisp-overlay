{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-coleslaw-src";
  inherit name rev sha256;
};
