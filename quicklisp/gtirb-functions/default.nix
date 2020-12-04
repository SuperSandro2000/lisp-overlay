{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-gtirb-functions-src";
  inherit name rev sha256;
};
