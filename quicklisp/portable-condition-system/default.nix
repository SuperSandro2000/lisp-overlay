{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-portable-condition-system-src";
  inherit name rev sha256;
};
