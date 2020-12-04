{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-deoxybyte-systems-src";
  inherit name rev sha256;
};
