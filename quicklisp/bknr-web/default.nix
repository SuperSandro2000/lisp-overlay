{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-bknr-web-src";
  inherit name rev sha256;
};
