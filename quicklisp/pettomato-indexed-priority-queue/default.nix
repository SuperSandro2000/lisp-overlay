{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-pettomato-indexed-priority-queue-src";
  inherit name rev sha256;
};
