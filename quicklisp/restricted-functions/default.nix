{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-restricted-functions-src";
  inherit name rev sha256;
};
