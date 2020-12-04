{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-lisp-gflags-src";
  inherit name rev sha256;
};
