{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-tap-unit-test-src";
  inherit name rev sha256;
};
