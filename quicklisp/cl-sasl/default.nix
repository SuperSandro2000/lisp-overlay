{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-sasl-src";
  inherit (meta) rev sha256;
};
