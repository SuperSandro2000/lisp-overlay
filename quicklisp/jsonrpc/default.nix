{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-jsonrpc-src";
  inherit name rev sha256;
};
