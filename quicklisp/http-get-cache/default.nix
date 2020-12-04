{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-http-get-cache-src";
  inherit name rev sha256;
};
