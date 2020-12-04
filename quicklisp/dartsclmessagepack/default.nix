{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-dartsclmessagepack-src";
  inherit name rev sha256;
};
