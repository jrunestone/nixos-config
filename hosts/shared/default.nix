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
    ./features/system/gfx.nix
    ./features/system/wired.nix
    ./features/system/pipewire.nix
    ./features/system/ssh.nix
    ./features/system/font.nix
    ./features/system/hyprland.nix
    ./features/system/1password.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
      trusted-users = [ "root" "@wheel" ];
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

  # same username for all hosts
  users.users.jr = {
    isNormalUser = true;
  
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "networkmanager"
    ];

    hashedPasswordFile = "/nix/persist/system/passwords/jr";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs outputs; };
  home-manager.users.jr = import ../${config.networking.hostName}/home.nix;
}