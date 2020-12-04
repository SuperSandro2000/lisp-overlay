{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-data-format-validation-src";
  inherit name rev sha256;
};
