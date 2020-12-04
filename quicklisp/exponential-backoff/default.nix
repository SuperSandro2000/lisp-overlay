{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-exponential-backoff-src";
  inherit name rev sha256;
};
