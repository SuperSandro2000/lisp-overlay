{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-vas-string-metrics-src";
  inherit name rev sha256;
};
