{
  description = "jr-nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";
    impermanence.url = "github:nix-community/impermanence";

    inputs.disko.url = "github:nix-community/disko";
    inputs.disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, disko, impermanence, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [ "x86_64-linux" ];
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
    in
    {
      inherit lib;
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;
      overlays = import ./overlays { inherit inputs outputs; };
      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        jr-home = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ 
            impermanence.nixosModules.impermanence
            disko.nixosModules.disko
            ./hosts/jr-home
          ];
        };

        jr-work = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ 
            impermanence.nixosModules.impermanence
            disko.nixosModules.disko
            ./hosts/jr-work
          ];
        };

        jr-vm = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ 
            impermanence.nixosModules.impermanence
            disko.nixosModules.disko
            (import ./disko-config.nix { disk = "/dev/sda"; pp = ""; })
            ./hosts/jr-vm
          ];
        };
      };
    };
}
