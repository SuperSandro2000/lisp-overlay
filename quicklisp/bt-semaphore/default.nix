{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-bt-semaphore-src";
  inherit name rev sha256;
};
