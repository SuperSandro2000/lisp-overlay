{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-one-time-passwords-src";
  inherit name rev sha256;
};
