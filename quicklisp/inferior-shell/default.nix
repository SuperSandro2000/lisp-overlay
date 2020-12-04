{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-inferior-shell-src";
  inherit name rev sha256;
};
