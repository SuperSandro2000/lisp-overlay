{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-electron-tools-src";
  inherit name rev sha256;
};
