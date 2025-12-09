{ pkgs, inputs, ... }: {
  imports = [
    (import ../shared/disko-config.nix { disk = "/dev/nvme0n1"; })

    ./hardware-configuration.nix

    ../shared
    ../shared/features/system/podman.nix
    ../shared/features/system/1password.nix
    ../shared/features/system/twingate.nix
    ../shared/features/system/insomnia.nix
    
    ./features/system
    ./features/system/persistence.nix
  ];

  host-options.system = {
    autoLogin = true;
  };

  system.stateVersion = "24.05";
}
