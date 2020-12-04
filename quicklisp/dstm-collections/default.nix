{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-dstm-collections-src";
  inherit name rev sha256;
};
