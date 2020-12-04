{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-wadler-pprint-src";
  inherit name rev sha256;
};
