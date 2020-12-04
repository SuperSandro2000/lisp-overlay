{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-configuration.options-src";
  inherit name rev sha256;
};
