{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-parser.common-rules-src";
  inherit name rev sha256;
};
