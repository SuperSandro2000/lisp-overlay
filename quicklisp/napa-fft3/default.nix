{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-napa-fft3-src";
  inherit name rev sha256;
};
