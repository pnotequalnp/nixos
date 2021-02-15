{
  description = "Nix configurations";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-doom-emacs = {
      url = "github:vlaci/nix-doom-emacs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    chrome-dark.url = "github:pnotequalnp/chrome-dark";
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, nix-doom-emacs, chrome-dark }: {
    homeConfigurations = {
      tarvos = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = /home/kevin;
        username = "kevin";
        configuration = { pkgs, ... }: {
          nixpkgs.overlays = [ chrome-dark.overlay ];
          imports = [
            nix-doom-emacs.hmModule
            ./home/hosts/tarvos.nix
          ];
        };
      };

      minimal = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = /home/kevin;
        username = "kevin";
        configuration = { pkgs, ... }: {
          nixpkgs.overlays = [ chrome-dark.overlay ];
          imports = [
            nix-doom-emacs.hmModule
            ./home/hosts/minimal.nix
          ];
        };
      };
    };

    nixosConfigurations = {
      tarvos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/hosts/tarvos
          nixpkgs.nixosModules.notDetected
          nixos-hardware.nixosModules.lenovo-thinkpad-t490
        ];
      };
    };

    devShell.x86_64-linux =
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
        xmonadPkgs = import ./home/profiles/x11-environment/xmonad/packages.nix;
      in pkgs.mkShell {
        buildInputs = with pkgs; [
          (pkgs.haskellPackages.ghcWithHoogle xmonadPkgs)
        ];
      };
  };
}
