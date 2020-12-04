{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-easy-audio-src";
  inherit name rev sha256;
};
