{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-py4cl2-src";
  inherit (meta) rev sha256;
};
