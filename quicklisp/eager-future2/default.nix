{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-eager-future2-src";
  inherit name rev sha256;
};
