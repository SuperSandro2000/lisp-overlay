{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-iso-8601-date-src";
  inherit name rev sha256;
};
