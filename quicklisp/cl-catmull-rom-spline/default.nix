{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-catmull-rom-spline-src";
  inherit name rev sha256;
};
