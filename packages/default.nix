{ pkgs, ... }:
{
  formatter = pkgs.callPackage ./formatter.nix { };
}
