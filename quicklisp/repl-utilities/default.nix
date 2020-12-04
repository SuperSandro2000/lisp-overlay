{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-repl-utilities-src";
  inherit name rev sha256;
};
