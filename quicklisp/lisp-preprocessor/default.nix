{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-lisp-preprocessor-src";
  inherit name rev sha256;
};
