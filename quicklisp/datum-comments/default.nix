{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-datum-comments-src";
  inherit name rev sha256;
};
