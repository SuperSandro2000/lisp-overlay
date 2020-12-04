{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-tmpdir-src";
  inherit name rev sha256;
};
