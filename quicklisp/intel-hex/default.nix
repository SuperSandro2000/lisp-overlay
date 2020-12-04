{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-intel-hex-src";
  inherit name rev sha256;
};
