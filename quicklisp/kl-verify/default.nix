{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-kl-verify-src";
  inherit name rev sha256;
};
