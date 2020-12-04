{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-dbi-connection-pool-src";
  inherit name rev sha256;
};
