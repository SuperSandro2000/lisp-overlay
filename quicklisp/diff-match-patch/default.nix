{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-diff-match-patch-src";
  inherit name rev sha256;
};
