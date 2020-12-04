{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-stealth-mixin-src";
  inherit name rev sha256;
};
