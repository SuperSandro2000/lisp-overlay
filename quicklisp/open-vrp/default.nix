{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-open-vrp-src";
  inherit name rev sha256;
};
