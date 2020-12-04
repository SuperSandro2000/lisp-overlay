{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-changed-stream-src";
  inherit name rev sha256;
};
