{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-grovel-locally-src";
  inherit name rev sha256;
};
