{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-parser.ini-src";
  inherit name rev sha256;
};
