{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-com.clearly-useful.iterator-protocol-src";
  inherit name rev sha256;
};
