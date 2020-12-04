{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-postmodern-localtime-src";
  inherit name rev sha256;
};
