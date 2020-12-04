{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-external-symbol-not-found-src";
  inherit name rev sha256;
};
