{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-pithy-xml-src";
  inherit name rev sha256;
};
