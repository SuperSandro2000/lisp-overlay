{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-c2ffi-blob-src";
  inherit (meta) rev sha256;
};
