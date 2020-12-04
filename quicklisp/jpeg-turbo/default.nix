{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-jpeg-turbo-src";
  inherit name rev sha256;
};
