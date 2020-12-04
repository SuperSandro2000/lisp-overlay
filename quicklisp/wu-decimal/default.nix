{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-wu-decimal-src";
  inherit name rev sha256;
};
