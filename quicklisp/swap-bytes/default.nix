{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-swap-bytes-src";
  inherit (meta) rev sha256;
};
