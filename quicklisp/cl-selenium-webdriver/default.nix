{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-selenium-webdriver-src";
  inherit name rev sha256;
};
