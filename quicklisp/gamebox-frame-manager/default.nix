{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-gamebox-frame-manager-src";
  inherit name rev sha256;
};
