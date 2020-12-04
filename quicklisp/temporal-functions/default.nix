{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-temporal-functions-src";
  inherit name rev sha256;
};
