{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-qtools-ui-src";
  inherit name rev sha256;
};
