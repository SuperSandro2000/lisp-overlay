{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-rfc2388-src";
  inherit name rev sha256;
};
