{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-aws-sign4-src";
  inherit name rev sha256;
};
