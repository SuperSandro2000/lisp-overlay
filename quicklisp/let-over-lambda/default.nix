{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-let-over-lambda-src";
  inherit name rev sha256;
};
