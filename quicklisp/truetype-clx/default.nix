{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-truetype-clx-src";
  inherit name rev sha256;
};
