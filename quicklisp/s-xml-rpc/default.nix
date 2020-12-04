{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-s-xml-rpc-src";
  inherit name rev sha256;
};
