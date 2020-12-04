{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-css-selectors-src";
  inherit name rev sha256;
};
