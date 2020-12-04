{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-glsl-toolkit-src";
  inherit name rev sha256;
};
