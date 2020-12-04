{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-literate-lisp-src";
  inherit name rev sha256;
};
