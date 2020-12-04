{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-form-fiddle-src";
  inherit name rev sha256;
};
