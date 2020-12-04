{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-illogical-pathnames-src";
  inherit name rev sha256;
};
