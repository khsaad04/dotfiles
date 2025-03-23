{
  description = "KHSaad's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      mkHost =
        hostName:
        inputs.nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
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
      packages.${system} = import ./packages { inherit pkgs; };
      formatter.${system} = inputs.self.packages.${system}.formatter;
    };
}
