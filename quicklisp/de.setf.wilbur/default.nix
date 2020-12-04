{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-de.setf.wilbur-src";
  inherit name rev sha256;
};
