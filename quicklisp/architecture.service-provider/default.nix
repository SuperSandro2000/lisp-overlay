{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-architecture.service-provider-src";
  inherit name rev sha256;
};
