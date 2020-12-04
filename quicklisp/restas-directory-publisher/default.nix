{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-restas-directory-publisher-src";
  inherit name rev sha256;
};
