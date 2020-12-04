{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-copy-directory-src";
  inherit name rev sha256;
};
