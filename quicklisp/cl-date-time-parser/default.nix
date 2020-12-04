{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-date-time-parser-src";
  inherit name rev sha256;
};
