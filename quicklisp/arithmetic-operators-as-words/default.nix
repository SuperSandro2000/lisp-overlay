{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-arithmetic-operators-as-words-src";
  inherit name rev sha256;
};
