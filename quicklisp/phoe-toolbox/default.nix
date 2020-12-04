{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-phoe-toolbox-src";
  inherit name rev sha256;
};
