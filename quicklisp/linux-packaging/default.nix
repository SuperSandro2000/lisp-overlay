{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-linux-packaging-src";
  inherit name rev sha256;
};
