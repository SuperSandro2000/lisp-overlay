{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-sandalphon.lambda-list-src";
  inherit name rev sha256;
};
