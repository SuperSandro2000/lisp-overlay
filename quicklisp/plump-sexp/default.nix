{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-plump-sexp-src";
  inherit name rev sha256;
};
