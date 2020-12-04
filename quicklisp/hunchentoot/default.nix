{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-hunchentoot-src";
  inherit (meta) rev sha256;
};
