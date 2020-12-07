{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-bunny-src";
  inherit (meta) rev sha256;
};