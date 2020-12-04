{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-parseltongue-src";
  inherit name rev sha256;
};
