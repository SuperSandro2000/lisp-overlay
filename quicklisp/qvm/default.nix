{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-qvm-src";
  inherit (meta) rev sha256;
};
