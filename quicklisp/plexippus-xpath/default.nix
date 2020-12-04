{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-plexippus-xpath-src";
  inherit name rev sha256;
};
