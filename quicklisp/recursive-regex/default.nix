{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-recursive-regex-src";
  inherit name rev sha256;
};
