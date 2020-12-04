{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-golden-utils-src";
  inherit name rev sha256;
};
