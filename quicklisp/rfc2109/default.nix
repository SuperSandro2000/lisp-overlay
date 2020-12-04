{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-rfc2109-src";
  inherit name rev sha256;
};
