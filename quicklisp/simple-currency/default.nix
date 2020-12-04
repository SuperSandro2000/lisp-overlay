{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-simple-currency-src";
  inherit name rev sha256;
};
