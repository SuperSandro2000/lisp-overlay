{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-sdl2-mixer-src";
  inherit name rev sha256;
};
