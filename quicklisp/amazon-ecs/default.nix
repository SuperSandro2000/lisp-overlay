{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-amazon-ecs-src";
  inherit name rev sha256;
};
