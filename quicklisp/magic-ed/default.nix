{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-magic-ed-src";
  inherit name rev sha256;
};
