{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-claw-support-src";
  inherit (meta) rev sha256;
};
