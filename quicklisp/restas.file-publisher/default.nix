{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-restas.file-publisher-src";
  inherit name rev sha256;
};
