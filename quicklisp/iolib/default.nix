{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-iolib-src";
  inherit (meta) rev sha256;
};
