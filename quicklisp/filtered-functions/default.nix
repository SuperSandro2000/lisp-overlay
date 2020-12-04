{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-filtered-functions-src";
  inherit name rev sha256;
};
