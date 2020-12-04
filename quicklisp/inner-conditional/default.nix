{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-inner-conditional-src";
  inherit name rev sha256;
};
