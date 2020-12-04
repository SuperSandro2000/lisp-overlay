{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-parse-front-matter-src";
  inherit name rev sha256;
};
