{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-semantic-spinneret-src";
  inherit name rev sha256;
};
