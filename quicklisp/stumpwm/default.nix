{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-stumpwm-src";
  inherit name rev sha256;
};
