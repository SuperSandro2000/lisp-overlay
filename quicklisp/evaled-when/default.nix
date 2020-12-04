{ pkgs, ... }: let
  sha256 = builtins.readFile ./meta.hash;
in builtins.fetchTarball {
  inherit sha256;
};
