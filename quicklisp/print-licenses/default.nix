{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-print-licenses-src";
  inherit name rev sha256;
};
