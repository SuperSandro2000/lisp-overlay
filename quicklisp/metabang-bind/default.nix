{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-metabang-bind-src";
  inherit name rev sha256;
};
