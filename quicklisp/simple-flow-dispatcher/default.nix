{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-simple-flow-dispatcher-src";
  inherit (meta) rev sha256;
};
