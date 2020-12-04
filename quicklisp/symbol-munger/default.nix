{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-symbol-munger-src";
  inherit name rev sha256;
};
