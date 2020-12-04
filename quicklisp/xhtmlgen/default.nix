{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-xhtmlgen-src";
  inherit name rev sha256;
};
