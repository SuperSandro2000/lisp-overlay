{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-aws-foundation-src";
  inherit name rev sha256;
};
