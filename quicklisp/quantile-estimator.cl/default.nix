{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-quantile-estimator.cl-src";
  inherit name rev sha256;
};
