{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-lass-flexbox-src";
  inherit name rev sha256;
};
