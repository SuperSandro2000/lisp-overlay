{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-misc-extensions-src";
  inherit name rev sha256;
};
