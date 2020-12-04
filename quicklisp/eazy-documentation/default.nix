{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-eazy-documentation-src";
  inherit name rev sha256;
};
