{ pkgs, inputs, ... }: {
  imports = [
    (import ./disko-config.nix { disk = "/dev/nvme0n1"; })

    ./hardware-configuration.nix

    ../shared/default-barebones.nix
    ./features/system
  ];

  system.stateVersion = "24.05";
}
