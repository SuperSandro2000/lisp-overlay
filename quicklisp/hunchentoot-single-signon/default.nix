{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-hunchentoot-single-signon-src";
  inherit name rev sha256;
};
