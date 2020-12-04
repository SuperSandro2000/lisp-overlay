{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-dartsclhashtree-src";
  inherit name rev sha256;
};
