{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-bit-ops-src";
  inherit name rev sha256;
};
