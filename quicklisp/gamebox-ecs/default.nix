{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-gamebox-ecs-src";
  inherit name rev sha256;
};
