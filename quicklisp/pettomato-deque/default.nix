{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-pettomato-deque-src";
  inherit name rev sha256;
};
