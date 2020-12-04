{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-priority-queue-src";
  inherit name rev sha256;
};
