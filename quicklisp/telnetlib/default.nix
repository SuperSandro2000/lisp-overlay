{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-telnetlib-src";
  inherit name rev sha256;
};
