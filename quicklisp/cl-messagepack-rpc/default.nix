{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-messagepack-rpc-src";
  inherit name rev sha256;
};
