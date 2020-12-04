{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-algebraic-data-type-src";
  inherit name rev sha256;
};
