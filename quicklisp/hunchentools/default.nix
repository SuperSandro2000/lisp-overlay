{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-hunchentools-src";
  inherit name rev sha256;
};
