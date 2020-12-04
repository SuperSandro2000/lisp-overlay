{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-sealable-metaobjects-src";
  inherit name rev sha256;
};
