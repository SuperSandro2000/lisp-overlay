{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-org-davep-dictrepl-src";
  inherit name rev sha256;
};
