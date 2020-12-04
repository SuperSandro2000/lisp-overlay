{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-wu-sugar-src";
  inherit name rev sha256;
};
