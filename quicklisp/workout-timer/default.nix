{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-workout-timer-src";
  inherit name rev sha256;
};
