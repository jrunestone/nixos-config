{ inputs, lib, outputs, pkgs, config, ... }: let 
  cfg = config.system.nixos;
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./features/basic.nix
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

  system.nixos.label = lib.concatStringsSep "-" ((lib.sort (x: y: x < y) cfg.tags) ++ [ "${cfg.version}.${inputs.self.sourceInfo.shortRev or "dirty"}" ]);
}
