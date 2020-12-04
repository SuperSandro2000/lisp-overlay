{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-thread-pool-src";
  inherit name rev sha256;
};
