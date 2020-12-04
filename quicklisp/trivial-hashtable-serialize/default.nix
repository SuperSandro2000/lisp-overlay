{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-trivial-hashtable-serialize-src";
  inherit name rev sha256;
};
