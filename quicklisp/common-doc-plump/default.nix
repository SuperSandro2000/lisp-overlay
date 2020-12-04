{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-common-doc-plump-src";
  inherit name rev sha256;
};
