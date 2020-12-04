{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-local-package-aliases-src";
  inherit name rev sha256;
};
