{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-quasiquote-2.0-src";
  inherit name rev sha256;
};
