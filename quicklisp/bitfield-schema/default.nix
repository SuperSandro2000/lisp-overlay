{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-bitfield-schema-src";
  inherit name rev sha256;
};
