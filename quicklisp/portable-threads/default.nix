{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-portable-threads-src";
  inherit name rev sha256;
};
