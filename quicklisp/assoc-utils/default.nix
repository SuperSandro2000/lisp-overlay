{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-assoc-utils-src";
  inherit name rev sha256;
};
