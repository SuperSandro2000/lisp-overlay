{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-quicklisp-slime-helper-src";
  inherit name rev sha256;
};
