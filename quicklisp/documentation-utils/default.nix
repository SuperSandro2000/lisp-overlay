{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-documentation-utils-src";
  inherit name rev sha256;
};
