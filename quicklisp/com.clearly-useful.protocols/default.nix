{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-com.clearly-useful.protocols-src";
  inherit name rev sha256;
};
