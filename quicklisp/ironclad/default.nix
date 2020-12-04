{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-ironclad-src";
  inherit (meta) rev sha256;
};
