{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-asdf-finalizers-src";
  inherit name rev sha256;
};
