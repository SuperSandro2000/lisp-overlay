{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-delta-debug-src";
  inherit name rev sha256;
};
