{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-asdf-linguist-src";
  inherit name rev sha256;
};
