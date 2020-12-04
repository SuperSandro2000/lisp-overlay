{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-l10n-cldr-src";
  inherit name rev sha256;
};
