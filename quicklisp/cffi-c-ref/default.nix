{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cffi-c-ref-src";
  inherit (meta) rev sha256;
};
