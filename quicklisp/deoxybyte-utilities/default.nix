{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-deoxybyte-utilities-src";
  inherit name rev sha256;
};
