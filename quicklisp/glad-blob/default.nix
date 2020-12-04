{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-glad-blob-src";
  inherit (meta) rev sha256;
};
