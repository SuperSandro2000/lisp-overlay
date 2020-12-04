{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-utilities.print-items-src";
  inherit name rev sha256;
};
