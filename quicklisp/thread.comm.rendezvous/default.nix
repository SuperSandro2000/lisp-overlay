{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-thread.comm.rendezvous-src";
  inherit name rev sha256;
};
