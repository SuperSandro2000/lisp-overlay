{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-quilc-src";
  inherit (meta) rev sha256;
};
