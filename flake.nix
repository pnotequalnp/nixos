{
  description = "NixOS configuration";
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.09;
  inputs.nixos-hardware.url = github:NixOS/nixos-hardware/master;

  outputs = { self, nixpkgs, nixos-hardware }: {
    nixosConfigurations.tarvos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hosts/tarvos.nix
        nixpkgs.nixosModules.notDetected
        nixos-hardware.nixosModules.lenovo-thinkpad-t490
      ];
    };
  };
}
