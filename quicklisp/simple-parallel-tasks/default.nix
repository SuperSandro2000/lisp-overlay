{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-simple-parallel-tasks-src";
  inherit name rev sha256;
};
