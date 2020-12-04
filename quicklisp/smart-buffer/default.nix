{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-smart-buffer-src";
  inherit name rev sha256;
};
