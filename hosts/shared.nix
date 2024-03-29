{ inputs, lib, outputs, pkgs, config, ... }: let 
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko
    inputs.grub2-themes.nixosModules.default
    
    ./features/bootloader.nix
    ./features/basic.nix
    ./features/environment.nix
    ./features/ssh.nix
    ./features/flatpak.nix
    ./features/gnome.nix
    ./features/persistence.nix
    ./features/gfx.nix
    ./features/wired.nix
    ./features/pipewire.nix
    ./features/podman.nix
    ./features/1password.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  users.mutableUsers = false;

  users.users.jr = {
    isNormalUser = true;
  
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "networkmanager"
    ];

    icon = ../assets/jr.png;
    hashedPasswordFile = "/nix/persist/system/passwords/jr";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs outputs; };
  home-manager.users.jr = import ../home-manager/${config.networking.hostName};
}
