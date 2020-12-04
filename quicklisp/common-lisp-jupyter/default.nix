{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-common-lisp-jupyter-src";
  inherit name rev sha256;
};
