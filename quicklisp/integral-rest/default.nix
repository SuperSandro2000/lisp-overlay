{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-integral-rest-src";
  inherit name rev sha256;
};
