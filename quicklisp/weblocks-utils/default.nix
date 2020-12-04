{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-weblocks-utils-src";
  inherit name rev sha256;
};
