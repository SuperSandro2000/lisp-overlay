{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-the-cost-of-nothing-src";
  inherit name rev sha256;
};
