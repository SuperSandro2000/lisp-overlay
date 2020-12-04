{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-transparent-wrap-src";
  inherit name rev sha256;
};
