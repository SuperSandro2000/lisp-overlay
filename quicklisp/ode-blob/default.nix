{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-ode-blob-src";
  inherit (meta) rev sha256;
};
