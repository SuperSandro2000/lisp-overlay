{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-bit-smasher-src";
  inherit name rev sha256;
};
