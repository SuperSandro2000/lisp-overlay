{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-proc-parse-src";
  inherit name rev sha256;
};
