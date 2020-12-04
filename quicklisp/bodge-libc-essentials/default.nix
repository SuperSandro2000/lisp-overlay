{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-bodge-libc-essentials-src";
  inherit (meta) rev sha256;
};
