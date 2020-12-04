{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-sequence-iterators-src";
  inherit name rev sha256;
};
