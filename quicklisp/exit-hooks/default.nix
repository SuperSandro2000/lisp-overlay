{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-exit-hooks-src";
  inherit name rev sha256;
};
