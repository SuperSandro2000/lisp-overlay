{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-serializable-object-src";
  inherit name rev sha256;
};
