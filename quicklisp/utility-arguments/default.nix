{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-utility-arguments-src";
  inherit name rev sha256;
};
