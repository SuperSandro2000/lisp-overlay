{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-numpy-file-format-src";
  inherit name rev sha256;
};
