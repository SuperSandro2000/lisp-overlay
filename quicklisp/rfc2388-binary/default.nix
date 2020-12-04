{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-rfc2388-binary-src";
  inherit name rev sha256;
};
