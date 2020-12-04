{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-bknr-datastore-src";
  inherit name rev sha256;
};
