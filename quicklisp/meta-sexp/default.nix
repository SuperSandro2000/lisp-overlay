{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-meta-sexp-src";
  inherit name rev sha256;
};
