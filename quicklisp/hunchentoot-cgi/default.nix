{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-hunchentoot-cgi-src";
  inherit name rev sha256;
};
