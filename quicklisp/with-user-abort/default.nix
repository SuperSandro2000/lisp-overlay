{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-with-user-abort-src";
  inherit name rev sha256;
};
