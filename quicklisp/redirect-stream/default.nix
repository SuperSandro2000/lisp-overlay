{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-redirect-stream-src";
  inherit name rev sha256;
};
