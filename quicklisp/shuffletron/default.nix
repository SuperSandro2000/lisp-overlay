{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-shuffletron-src";
  inherit name rev sha256;
};
