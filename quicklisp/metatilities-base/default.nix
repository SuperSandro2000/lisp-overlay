{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-metatilities-base-src";
  inherit name rev sha256;
};
