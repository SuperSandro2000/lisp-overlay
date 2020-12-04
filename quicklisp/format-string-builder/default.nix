{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-format-string-builder-src";
  inherit name rev sha256;
};
