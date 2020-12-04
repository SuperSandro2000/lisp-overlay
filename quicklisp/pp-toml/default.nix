{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-pp-toml-src";
  inherit name rev sha256;
};
