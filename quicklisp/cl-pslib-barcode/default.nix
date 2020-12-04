{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-pslib-barcode-src";
  inherit name rev sha256;
};
