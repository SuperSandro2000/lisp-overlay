{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-madeira-port-src";
  inherit name rev sha256;
};
