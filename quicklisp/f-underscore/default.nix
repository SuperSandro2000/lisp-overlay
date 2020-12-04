{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-f-underscore-src";
  inherit name rev sha256;
};
