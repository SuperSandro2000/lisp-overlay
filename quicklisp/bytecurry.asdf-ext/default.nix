{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-bytecurry.asdf-ext-src";
  inherit name rev sha256;
};
