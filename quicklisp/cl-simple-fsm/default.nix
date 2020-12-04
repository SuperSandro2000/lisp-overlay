{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-simple-fsm-src";
  inherit name rev sha256;
};
