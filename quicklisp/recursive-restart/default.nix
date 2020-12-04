{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-recursive-restart-src";
  inherit name rev sha256;
};
