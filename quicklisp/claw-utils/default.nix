{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-claw-utils-src";
  inherit (meta) rev sha256;
};
