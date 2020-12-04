{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-basic-binary-ipc-src";
  inherit name rev sha256;
};
