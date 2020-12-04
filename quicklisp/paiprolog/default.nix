{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-paiprolog-src";
  inherit name rev sha256;
};
