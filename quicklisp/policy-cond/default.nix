{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-policy-cond-src";
  inherit name rev sha256;
};
