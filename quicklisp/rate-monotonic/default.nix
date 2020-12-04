{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-rate-monotonic-src";
  inherit name rev sha256;
};
