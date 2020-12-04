{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-hyperluminal-mem-src";
  inherit name rev sha256;
};
