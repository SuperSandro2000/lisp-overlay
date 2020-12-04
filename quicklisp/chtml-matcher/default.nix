{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-chtml-matcher-src";
  inherit name rev sha256;
};
