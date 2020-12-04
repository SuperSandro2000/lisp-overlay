{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-read-as-string-src";
  inherit name rev sha256;
};
