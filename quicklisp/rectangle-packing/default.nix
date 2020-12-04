{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-rectangle-packing-src";
  inherit name rev sha256;
};
