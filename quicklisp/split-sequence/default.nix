{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-split-sequence-src";
  inherit (meta) rev sha256;
};
