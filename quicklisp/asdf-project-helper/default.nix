{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-asdf-project-helper-src";
  inherit name rev sha256;
};
