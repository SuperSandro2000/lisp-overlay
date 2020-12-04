{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-prometheus.cl-src";
  inherit name rev sha256;
};
