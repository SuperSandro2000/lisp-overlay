{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-base-blobs-src";
  inherit (meta) rev sha256;
};
