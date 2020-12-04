{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-wild-package-inferred-system-src";
  inherit name rev sha256;
};
