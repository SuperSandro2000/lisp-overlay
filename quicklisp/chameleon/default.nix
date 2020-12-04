{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-chameleon-src";
  inherit (meta) rev sha256;
};
