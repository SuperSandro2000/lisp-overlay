{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-dbd-oracle-src";
  inherit name rev sha256;
};
