{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-lisp-interface-library-src";
  inherit name rev sha256;
};
