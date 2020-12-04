{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-clim-pkg-doc-src";
  inherit name rev sha256;
};
