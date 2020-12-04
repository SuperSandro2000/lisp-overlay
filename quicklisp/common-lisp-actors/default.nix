{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-common-lisp-actors-src";
  inherit name rev sha256;
};
