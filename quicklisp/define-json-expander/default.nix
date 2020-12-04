{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-define-json-expander-src";
  inherit name rev sha256;
};
