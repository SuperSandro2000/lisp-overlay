{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-named-read-macros-src";
  inherit name rev sha256;
};
