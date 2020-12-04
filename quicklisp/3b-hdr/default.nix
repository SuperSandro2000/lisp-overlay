{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-3b-hdr-src";
  inherit name rev sha256;
};
