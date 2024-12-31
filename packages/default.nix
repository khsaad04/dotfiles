{ pkgs, ... }:
{
  formatter = pkgs.callPackage ./formatter.nix { };
  changevolume = pkgs.callPackage ./changevolume.nix { };
  powermenu = pkgs.callPackage ./powermenu.nix { };
}
