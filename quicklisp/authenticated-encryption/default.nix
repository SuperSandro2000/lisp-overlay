{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-authenticated-encryption-src";
  inherit name rev sha256;
};
