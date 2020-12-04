{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-com.clearly-useful.generic-collection-interface-src";
  inherit name rev sha256;
};
