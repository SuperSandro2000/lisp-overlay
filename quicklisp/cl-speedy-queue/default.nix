{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-speedy-queue-src";
  inherit name rev sha256;
};
