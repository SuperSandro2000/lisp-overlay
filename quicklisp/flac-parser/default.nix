{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-flac-parser-src";
  inherit name rev sha256;
};
