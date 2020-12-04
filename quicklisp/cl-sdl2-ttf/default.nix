{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-sdl2-ttf-src";
  inherit name rev sha256;
};
