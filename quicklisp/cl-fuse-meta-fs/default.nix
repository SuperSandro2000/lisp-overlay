{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-fuse-meta-fs-src";
  inherit name rev sha256;
};
