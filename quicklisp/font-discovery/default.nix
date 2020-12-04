{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-font-discovery-src";
  inherit name rev sha256;
};
