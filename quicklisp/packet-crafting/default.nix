{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-packet-crafting-src";
  inherit name rev sha256;
};
