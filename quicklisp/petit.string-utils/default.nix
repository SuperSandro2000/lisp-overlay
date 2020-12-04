{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-petit.string-utils-src";
  inherit name rev sha256;
};
