{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-fare-csv-src";
  inherit name rev sha256;
};
