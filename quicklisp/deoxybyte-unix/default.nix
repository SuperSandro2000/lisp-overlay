{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-deoxybyte-unix-src";
  inherit name rev sha256;
};
