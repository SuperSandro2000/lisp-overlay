{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-clx-xkeyboard-src";
  inherit name rev sha256;
};
