{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-package-renaming-src";
  inherit name rev sha256;
};
