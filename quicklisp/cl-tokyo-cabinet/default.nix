{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-tokyo-cabinet-src";
  inherit name rev sha256;
};
