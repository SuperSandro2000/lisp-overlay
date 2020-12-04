{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-yahoo-finance-src";
  inherit name rev sha256;
};
