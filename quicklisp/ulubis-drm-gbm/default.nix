{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-ulubis-drm-gbm-src";
  inherit name rev sha256;
};
