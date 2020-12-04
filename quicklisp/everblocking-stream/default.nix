{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-everblocking-stream-src";
  inherit name rev sha256;
};
