{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-tulip-graph-src";
  inherit name rev sha256;
};
