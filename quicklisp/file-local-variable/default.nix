{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-file-local-variable-src";
  inherit name rev sha256;
};
