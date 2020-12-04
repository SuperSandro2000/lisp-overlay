{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-practical-cl-src";
  inherit name rev sha256;
};
