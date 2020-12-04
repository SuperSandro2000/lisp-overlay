{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-libpuzzle-src";
  inherit name rev sha256;
};
