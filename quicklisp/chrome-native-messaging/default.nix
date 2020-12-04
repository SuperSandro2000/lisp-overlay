{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-chrome-native-messaging-src";
  inherit name rev sha256;
};
