{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-open-location-code-src";
  inherit name rev sha256;
};
