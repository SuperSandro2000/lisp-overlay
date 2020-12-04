{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-3bgl-shader-src";
  inherit name rev sha256;
};
