{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-trivial-mimes-src";
  inherit name rev sha256;
};