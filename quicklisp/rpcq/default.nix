{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-rpcq-src";
  inherit (meta) rev sha256;
};
