{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-eazy-gnuplot-src";
  inherit name rev sha256;
};
