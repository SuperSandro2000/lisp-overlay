{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-xsubseq-src";
  inherit name rev sha256;
};
