{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-unix-opts-src";
  inherit name rev sha256;
};
