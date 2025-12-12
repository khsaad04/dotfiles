{
  description = "KHSaad's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }@inputs:
    let
      mkHost = hostName:
        inputs.nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/hosts/${hostName}/configuration.nix
            ./nixos/hosts/${hostName}/hardware-configuration.nix
            ./nixos
            { networking.hostName = "${hostName}"; }
          ];
        };
    in
    {
      nixosConfigurations = {
        desktop = mkHost "desktop";
      };
    };
}
