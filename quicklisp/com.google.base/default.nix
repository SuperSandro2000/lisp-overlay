{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-com.google.base-src";
  inherit name rev sha256;
};
