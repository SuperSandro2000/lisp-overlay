{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-multival-plist-src";
  inherit name rev sha256;
};
