{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-trivial-package-local-nicknames-src";
  inherit name rev sha256;
};
