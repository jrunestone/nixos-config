{ pkgs, inputs, ... }: {
  imports = [
    (import ../../disko-config.nix { disk = "/dev/nvme0n1"; })
    (import ./disko-config.nix { disk = "/dev/nvme1n1"; })

    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    ../shared.nix
    ./monitors.nix
    ../features/steam.nix
  ];

  # host specific overrides
  hardware.bluetooth.enable = false;

  boot.loader.grub2-theme.screen = "4k";
  boot.loader.grub2-theme.splashImage = ../../assets/grub-4k.jpg;

  networking = {
    hostName = "jr-home";
  };

  system.stateVersion = "24.05";
}
