{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-rs-colors-src";
  inherit name rev sha256;
};
