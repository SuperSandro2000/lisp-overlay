{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-event-emitter-src";
  inherit name rev sha256;
};
