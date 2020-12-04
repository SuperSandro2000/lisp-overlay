{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-local-time-duration-src";
  inherit name rev sha256;
};
