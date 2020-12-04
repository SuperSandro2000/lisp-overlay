{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-mk-string-metrics-src";
  inherit name rev sha256;
};
