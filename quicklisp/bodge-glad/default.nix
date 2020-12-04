{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-bodge-glad-src";
  inherit (meta) rev sha256;
};
