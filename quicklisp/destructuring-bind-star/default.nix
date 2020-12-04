{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-destructuring-bind-star-src";
  inherit name rev sha256;
};
