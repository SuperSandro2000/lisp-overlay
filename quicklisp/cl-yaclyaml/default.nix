{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-yaclyaml-src";
  inherit name rev sha256;
};
