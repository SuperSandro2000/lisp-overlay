{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-lichat-tcp-client-src";
  inherit name rev sha256;
};
