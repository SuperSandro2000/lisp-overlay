{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-eazy-process-src";
  inherit name rev sha256;
};
