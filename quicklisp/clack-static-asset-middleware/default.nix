{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-clack-static-asset-middleware-src";
  inherit name rev sha256;
};
