{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-weblocks-prototype-js-src";
  inherit name rev sha256;
};
