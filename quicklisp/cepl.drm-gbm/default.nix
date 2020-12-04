{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cepl.drm-gbm-src";
  inherit name rev sha256;
};
