{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-postmodernity-src";
  inherit name rev sha256;
};
