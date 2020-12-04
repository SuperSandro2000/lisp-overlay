{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-simple-actors-src";
  inherit name rev sha256;
};
