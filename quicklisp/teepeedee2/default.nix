{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-teepeedee2-src";
  inherit name rev sha256;
};
