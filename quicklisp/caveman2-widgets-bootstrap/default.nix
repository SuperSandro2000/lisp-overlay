{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-caveman2-widgets-bootstrap-src";
  inherit name rev sha256;
};
