{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-list-named-class-src";
  inherit name rev sha256;
};
