{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-easy-routes-src";
  inherit name rev sha256;
};
