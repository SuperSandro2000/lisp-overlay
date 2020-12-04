{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-circular-streams-src";
  inherit name rev sha256;
};
