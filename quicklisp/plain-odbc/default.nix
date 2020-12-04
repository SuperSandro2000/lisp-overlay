{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-plain-odbc-src";
  inherit name rev sha256;
};
