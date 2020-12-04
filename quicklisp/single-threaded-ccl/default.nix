{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-single-threaded-ccl-src";
  inherit name rev sha256;
};
