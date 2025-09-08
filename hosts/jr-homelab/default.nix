{ pkgs, inputs, ... }: {
  imports = [
    (import ../shared/disko-config-barebones.nix { disk = "/dev/nvme0n1"; })

    ./hardware-configuration.nix

    ../shared/default-barebones.nix

    ./features/system
    ./features/system/ssh.nix
    ./features/system/incus.nix
  ];

  system.stateVersion = "24.05";
}
