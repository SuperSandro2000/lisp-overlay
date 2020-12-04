{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-monkeylib-prose-diff-src";
  inherit name rev sha256;
};
