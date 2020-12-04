{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-temporary-file-src";
  inherit name rev sha256;
};
