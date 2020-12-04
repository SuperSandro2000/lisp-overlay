{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-reader-src";
  inherit (meta) rev sha256;
};
