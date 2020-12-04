{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-libsvm-format-src";
  inherit name rev sha256;
};
