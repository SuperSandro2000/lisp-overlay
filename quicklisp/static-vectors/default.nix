{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-static-vectors-src";
  inherit (meta) rev sha256;
};
