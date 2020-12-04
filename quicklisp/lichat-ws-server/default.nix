{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-lichat-ws-server-src";
  inherit name rev sha256;
};
