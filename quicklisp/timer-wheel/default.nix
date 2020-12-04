{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-timer-wheel-src";
  inherit name rev sha256;
};
