{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-parse-number-src";
  inherit (meta) rev sha256;
};
