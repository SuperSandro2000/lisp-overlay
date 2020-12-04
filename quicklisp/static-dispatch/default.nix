{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-static-dispatch-src";
  inherit name rev sha256;
};
