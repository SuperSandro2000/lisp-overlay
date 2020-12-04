{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-structy-defclass-src";
  inherit name rev sha256;
};
