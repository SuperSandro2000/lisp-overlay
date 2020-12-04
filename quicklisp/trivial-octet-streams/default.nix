{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-trivial-octet-streams-src";
  inherit name rev sha256;
};
