{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-tesseract-capi-src";
  inherit name rev sha256;
};
