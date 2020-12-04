{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-computable-reals-src";
  inherit name rev sha256;
};
