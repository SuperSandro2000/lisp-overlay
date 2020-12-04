{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-lichat-ldap-src";
  inherit name rev sha256;
};
