{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-fiveam-asdf-src";
  inherit name rev sha256;
};
