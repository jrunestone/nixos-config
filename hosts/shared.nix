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
    ./features/ssh.nix
    ./features/gnome.nix
    ./features/persistence.nix
    ./features/gfx.nix
    ./features/wired.nix
    ./features/pipewire.nix
#    ./features/hyprland.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  security.sudo.extraConfig = ''
    Defaults lecture = never
  '';

  users.mutableUsers = false;

  users.users.jr = {
    isNormalUser = true;
  
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "networkmanager"
      "docker"
    ];
  
    hashedPasswordFile = "/nix/persist/system/passwords/jr";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs outputs; };
  home-manager.users.jr = import ../home-manager/${config.networking.hostName}.nix;
}
