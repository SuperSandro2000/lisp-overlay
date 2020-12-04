{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-sb-vector-io-src";
  inherit name rev sha256;
};
