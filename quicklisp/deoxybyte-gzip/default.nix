{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-deoxybyte-gzip-src";
  inherit name rev sha256;
};
