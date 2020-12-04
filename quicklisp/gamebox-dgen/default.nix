{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-gamebox-dgen-src";
  inherit name rev sha256;
};
