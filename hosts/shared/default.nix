{ inputs, lib, outputs, pkgs, config, ... }: let 
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko

    ./features/system
    ./features/system/boot.nix
    ./features/system/persistence.nix
    ./features/system/root-cert.nix
    ./features/system/gfx.nix
    ./features/system/wired.nix
    ./features/system/pipewire.nix
    ./features/system/ssh.nix
    ./features/system/font.nix
    ./features/system/printing.nix
    ./features/system/hyprland.nix
    ./features/system/greetd.nix
    ./features/system/yubikey.nix
    ./features/system/proton-auth.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  users.mutableUsers = false;

  # same username for all hosts
  users.users.jr = {
    isNormalUser = true;
  
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "networkmanager"
      "jackaudio"
    ];

    hashedPasswordFile = "/nix/persist/system/passwords/jr";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs outputs; };
  home-manager.backupFileExtension = "bak";
  home-manager.users.jr = import ../${config.networking.hostName}/home.nix;
}
