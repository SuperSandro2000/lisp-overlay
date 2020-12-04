{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-lorem-ipsum-src";
  inherit name rev sha256;
};
