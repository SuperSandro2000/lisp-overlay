{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-portableaserve-src";
  inherit name rev sha256;
};
