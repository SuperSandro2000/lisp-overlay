{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-reader-interception-src";
  inherit name rev sha256;
};
