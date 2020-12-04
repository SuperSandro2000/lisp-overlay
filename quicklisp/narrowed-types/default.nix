{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-narrowed-types-src";
  inherit name rev sha256;
};
