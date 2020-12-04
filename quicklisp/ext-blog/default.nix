{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-ext-blog-src";
  inherit name rev sha256;
};
