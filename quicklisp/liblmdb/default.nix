{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-liblmdb-src";
  inherit name rev sha256;
};
