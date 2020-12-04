{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-percent-encoding-src";
  inherit name rev sha256;
};
