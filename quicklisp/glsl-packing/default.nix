{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-glsl-packing-src";
  inherit name rev sha256;
};
