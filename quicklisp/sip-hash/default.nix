{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-sip-hash-src";
  inherit name rev sha256;
};
