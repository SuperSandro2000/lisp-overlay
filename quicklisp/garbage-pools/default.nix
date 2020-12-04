{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-garbage-pools-src";
  inherit name rev sha256;
};
