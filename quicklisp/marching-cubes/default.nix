{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-marching-cubes-src";
  inherit name rev sha256;
};
