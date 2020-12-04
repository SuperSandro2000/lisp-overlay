{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-flow-src";
  inherit (meta) rev sha256;
};
