{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    ../shared.nix
  ];

  boot.loader.grub2-theme.screen = "4k";

  networking = {
    hostName = "jr-home";
  };

  system.stateVersion = "24.05";
}
