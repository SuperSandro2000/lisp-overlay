{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-easy-bind-src";
  inherit name rev sha256;
};
