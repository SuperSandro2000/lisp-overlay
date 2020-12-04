{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-inquisitor-src";
  inherit name rev sha256;
};
