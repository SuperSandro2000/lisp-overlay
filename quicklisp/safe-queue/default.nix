{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-safe-queue-src";
  inherit name rev sha256;
};
