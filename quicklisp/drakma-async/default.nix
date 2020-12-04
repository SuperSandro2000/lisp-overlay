{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-drakma-async-src";
  inherit name rev sha256;
};
