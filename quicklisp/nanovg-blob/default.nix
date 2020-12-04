{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-nanovg-blob-src";
  inherit (meta) rev sha256;
};
