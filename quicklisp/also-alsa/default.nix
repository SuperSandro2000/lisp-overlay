{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-also-alsa-src";
  inherit name rev sha256;
};
