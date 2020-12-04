{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-trivial-macroexpand-all-src";
  inherit name rev sha256;
};
