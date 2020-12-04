{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-quicksearch-src";
  inherit name rev sha256;
};
