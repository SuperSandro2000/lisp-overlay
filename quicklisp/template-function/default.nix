{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-template-function-src";
  inherit (meta) rev sha256;
};
