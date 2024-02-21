{ pkgs, inputs, ... }: {
  imports = [
    (import ../../disko-config.nix { disk = "/dev/nvme0n1"; })

    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    ../shared.nix
    ./monitors.nix
  ];

  boot.loader.grub2-theme.screen = "4k";

  networking = {
    hostName = "jr-home";
  };

  system.stateVersion = "24.05";
}
