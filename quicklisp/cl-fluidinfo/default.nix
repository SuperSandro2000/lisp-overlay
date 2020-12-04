{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-fluidinfo-src";
  inherit name rev sha256;
};
