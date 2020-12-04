{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-documentation-utils-extensions-src";
  inherit name rev sha256;
};
