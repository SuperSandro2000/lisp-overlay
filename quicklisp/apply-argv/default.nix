{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-apply-argv-src";
  inherit name rev sha256;
};
