{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-plump-tex-src";
  inherit name rev sha256;
};
