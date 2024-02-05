{ inputs, lib, outputs, pkgs, config, ... }: let 
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  imports = [
    ./features/basic.nix
    ./features/persistence.nix
    ./features/gfx.nix
    ./features/wired.nix
    ./features/pipewire.nix
#    ./features/hyprland.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

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

  home-manager.users.jr = import ../home-manager/${config.networking.hostName}.nix;
  home-manager.extraSpecialArgs = { inherit inputs outputs; };
  programs.home-manager.enable = true;
}
