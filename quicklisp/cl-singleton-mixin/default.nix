{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-singleton-mixin-src";
  inherit name rev sha256;
};
