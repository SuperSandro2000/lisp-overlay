{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-nuclblog-src";
  inherit name rev sha256;
};
