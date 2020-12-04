{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-websocket-driver-src";
  inherit name rev sha256;
};
