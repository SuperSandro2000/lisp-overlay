{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-git-file-history-src";
  inherit name rev sha256;
};
