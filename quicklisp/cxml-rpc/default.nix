{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cxml-rpc-src";
  inherit name rev sha256;
};
