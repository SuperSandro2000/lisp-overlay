{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-mra-wavelet-plot-src";
  inherit name rev sha256;
};
