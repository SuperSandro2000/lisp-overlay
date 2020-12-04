{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-kekule-clj-src";
  inherit name rev sha256;
};
