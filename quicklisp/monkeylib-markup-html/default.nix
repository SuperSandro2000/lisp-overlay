{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-monkeylib-markup-html-src";
  inherit name rev sha256;
};
