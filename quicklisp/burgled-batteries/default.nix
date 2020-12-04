{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-burgled-batteries-src";
  inherit name rev sha256;
};
