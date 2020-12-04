{ pkgs, ... }: let
  meta = builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-bordeaux-threads-src";
  inherit (meta) rev sha256;
};
