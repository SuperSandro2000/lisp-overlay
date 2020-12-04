{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-arc-compat-src";
  inherit name rev sha256;
};
