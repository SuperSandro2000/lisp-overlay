{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-hl7-client-src";
  inherit name rev sha256;
};
