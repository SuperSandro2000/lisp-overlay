{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-trivial-with-current-source-form-src";
  inherit name rev sha256;
};
