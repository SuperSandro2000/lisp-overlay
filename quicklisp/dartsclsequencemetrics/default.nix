{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-dartsclsequencemetrics-src";
  inherit name rev sha256;
};
