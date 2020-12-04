{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-oxenfurt-src";
  inherit name rev sha256;
};
