{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-dartscltools-src";
  inherit name rev sha256;
};
