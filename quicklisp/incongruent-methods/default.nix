{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-incongruent-methods-src";
  inherit name rev sha256;
};
