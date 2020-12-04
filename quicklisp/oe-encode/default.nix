{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-oe-encode-src";
  inherit name rev sha256;
};
