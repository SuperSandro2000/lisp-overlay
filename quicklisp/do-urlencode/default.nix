{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-do-urlencode-src";
  inherit name rev sha256;
};
