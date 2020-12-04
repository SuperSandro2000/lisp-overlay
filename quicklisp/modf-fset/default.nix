{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-modf-fset-src";
  inherit name rev sha256;
};
