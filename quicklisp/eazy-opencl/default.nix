{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-eazy-opencl-src";
  inherit name rev sha256;
};
