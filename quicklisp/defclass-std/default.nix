{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-defclass-std-src";
  inherit name rev sha256;
};
