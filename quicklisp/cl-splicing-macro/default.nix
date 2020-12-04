{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-splicing-macro-src";
  inherit name rev sha256;
};
