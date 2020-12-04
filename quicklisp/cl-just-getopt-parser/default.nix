{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-just-getopt-parser-src";
  inherit name rev sha256;
};
