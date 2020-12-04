{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-petit.package-utils-src";
  inherit name rev sha256;
};
