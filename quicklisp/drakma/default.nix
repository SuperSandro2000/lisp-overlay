{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-drakma-src";
  inherit (meta) rev sha256;
};
