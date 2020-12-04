{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-algebraic-data-library-src";
  inherit name rev sha256;
};
