{
  description = "jr-nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";
    
    impermanence.url = "github:nix-community/impermanence";
    grub2-themes.url = "github:vinceliuice/grub2-themes";
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    self, 
    nixpkgs, 
    disko, 
    impermanence, 
    home-manager, 
    grub2-themes, 
    nixvim, 
    nix-flatpak, 
    ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [ "x86_64-linux" ];
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
    in {
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
            ./hosts/jr-home
          ];
        };

        jr-work = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ 
            ./hosts/jr-work
          ];
        };

        jr-vm = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ 
            ./hosts/jr-vm
          ];
        };
      };
    };
}
