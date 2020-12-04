{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-general-accumulator-src";
  inherit name rev sha256;
};
