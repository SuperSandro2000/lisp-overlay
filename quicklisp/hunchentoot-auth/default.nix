{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-hunchentoot-auth-src";
  inherit name rev sha256;
};
