{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-telegram-bot-src";
  inherit name rev sha256;
};
