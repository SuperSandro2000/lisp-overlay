{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-with-cached-reader-conditionals-src";
  inherit name rev sha256;
};
