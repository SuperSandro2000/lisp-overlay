{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-hdf5-cffi-src";
  inherit name rev sha256;
};
