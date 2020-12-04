{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-burgled-batteries.syntax-src";
  inherit name rev sha256;
};
