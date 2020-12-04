{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-deoxybyte-io-src";
  inherit name rev sha256;
};
