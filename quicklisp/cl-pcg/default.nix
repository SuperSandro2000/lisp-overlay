{ pkgs, ... }: let
  sha256 = builtins.readFile ./meta.hash;
in builtins.fetchMercurial {
  inherit sha256;
};
