{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-x.let-star-src";
  inherit name rev sha256;
};
