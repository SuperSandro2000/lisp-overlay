{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-nuklear-renderer-blob-src";
  inherit (meta) rev sha256;
};
