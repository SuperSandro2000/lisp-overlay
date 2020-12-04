{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-ugly-tiny-infix-macro-src";
  inherit name rev sha256;
};
