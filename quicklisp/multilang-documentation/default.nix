{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-multilang-documentation-src";
  inherit name rev sha256;
};
