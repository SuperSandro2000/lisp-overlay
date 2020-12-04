{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-assertion-error-src";
  inherit name rev sha256;
};
