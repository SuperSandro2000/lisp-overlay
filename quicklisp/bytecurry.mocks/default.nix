{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-bytecurry.mocks-src";
  inherit name rev sha256;
};
