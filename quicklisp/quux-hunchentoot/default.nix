{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-quux-hunchentoot-src";
  inherit name rev sha256;
};
