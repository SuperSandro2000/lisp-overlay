{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-piggyback-parameters-src";
  inherit name rev sha256;
};
