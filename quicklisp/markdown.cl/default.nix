{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-markdown.cl-src";
  inherit name rev sha256;
};
