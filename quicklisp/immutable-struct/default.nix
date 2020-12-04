{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-immutable-struct-src";
  inherit name rev sha256;
};
