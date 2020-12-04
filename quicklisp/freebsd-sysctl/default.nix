{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-freebsd-sysctl-src";
  inherit name rev sha256;
};
