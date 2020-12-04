{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-parser-combinators-src";
  inherit name rev sha256;
};
