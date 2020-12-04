{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-ulubis-sdl-src";
  inherit name rev sha256;
};
