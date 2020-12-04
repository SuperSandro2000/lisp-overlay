{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-hunchentoot-errors-src";
  inherit name rev sha256;
};
