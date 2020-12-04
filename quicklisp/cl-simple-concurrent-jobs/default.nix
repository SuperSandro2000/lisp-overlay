{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-simple-concurrent-jobs-src";
  inherit name rev sha256;
};
