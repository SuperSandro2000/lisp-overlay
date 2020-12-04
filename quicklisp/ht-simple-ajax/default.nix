{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-ht-simple-ajax-src";
  inherit name rev sha256;
};
