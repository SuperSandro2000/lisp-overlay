{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-pythonic-string-reader-src";
  inherit name rev sha256;
};
