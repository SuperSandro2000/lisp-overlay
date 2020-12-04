{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-fare-quasiquote-src";
  inherit name rev sha256;
};
