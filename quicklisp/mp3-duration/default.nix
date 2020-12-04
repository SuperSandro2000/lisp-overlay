{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-mp3-duration-src";
  inherit name rev sha256;
};
