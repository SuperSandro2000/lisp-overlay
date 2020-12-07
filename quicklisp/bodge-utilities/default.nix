{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-bodge-utilities-src";
  inherit (meta) rev sha256;
};