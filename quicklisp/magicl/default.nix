{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-magicl-src";
  inherit (meta) rev sha256;
};
