{ pkgs, ... }: let
  builtins.readFile ./meta.json;
in pkgs.fetchgit {
  name = "quicklisp-cl-swagger-codegen-src";
  inherit name rev sha256;
};
