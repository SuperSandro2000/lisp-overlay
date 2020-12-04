{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-matplotlib-cl-src";
  inherit name rev sha256;
};
