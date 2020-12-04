{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-org-davep-dict-src";
  inherit name rev sha256;
};
