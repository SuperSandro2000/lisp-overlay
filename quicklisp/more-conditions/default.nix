{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-more-conditions-src";
  inherit name rev sha256;
};
