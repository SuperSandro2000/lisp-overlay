{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-3b-swf-src";
  inherit name rev sha256;
};
