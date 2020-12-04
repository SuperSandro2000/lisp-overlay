{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-bodge-nanovg-src";
  inherit (meta) rev sha256;
};
