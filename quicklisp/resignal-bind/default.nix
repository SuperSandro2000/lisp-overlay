{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-resignal-bind-src";
  inherit name rev sha256;
};
