{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-com.clearly-useful.iterate-plus-src";
  inherit name rev sha256;
};
