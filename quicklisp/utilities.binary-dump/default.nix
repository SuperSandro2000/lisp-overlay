{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-utilities.binary-dump-src";
  inherit name rev sha256;
};
