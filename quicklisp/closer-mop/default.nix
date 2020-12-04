{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-closer-mop-src";
  inherit name rev sha256;
};
