{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-trivial-extensible-sequences-src";
  inherit name rev sha256;
};
