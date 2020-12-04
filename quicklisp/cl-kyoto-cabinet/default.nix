{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-kyoto-cabinet-src";
  inherit name rev sha256;
};
