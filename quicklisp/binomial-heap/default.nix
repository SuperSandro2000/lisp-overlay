{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-binomial-heap-src";
  inherit name rev sha256;
};
