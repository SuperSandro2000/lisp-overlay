{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-asd-generator-src";
  inherit name rev sha256;
};
