{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-orizuru-orm-src";
  inherit name rev sha256;
};
