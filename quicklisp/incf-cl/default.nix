{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-incf-cl-src";
  inherit name rev sha256;
};
