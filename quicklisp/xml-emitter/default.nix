{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-xml-emitter-src";
  inherit name rev sha256;
};
