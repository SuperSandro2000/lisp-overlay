{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-glfw-blob-src";
  inherit (meta) rev sha256;
};
