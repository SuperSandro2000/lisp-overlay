{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-ayah-captcha-src";
  inherit name rev sha256;
};
