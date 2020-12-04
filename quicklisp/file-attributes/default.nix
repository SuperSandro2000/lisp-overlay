{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-file-attributes-src";
  inherit name rev sha256;
};
