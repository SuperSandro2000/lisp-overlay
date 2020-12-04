{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-s-http-client-src";
  inherit name rev sha256;
};
