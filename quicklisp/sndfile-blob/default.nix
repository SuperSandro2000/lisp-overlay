{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-sndfile-blob-src";
  inherit (meta) rev sha256;
};
