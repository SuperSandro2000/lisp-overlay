{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-network-addresses-src";
  inherit name rev sha256;
};
