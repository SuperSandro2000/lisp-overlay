{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-dynamic-classes-src";
  inherit name rev sha256;
};
