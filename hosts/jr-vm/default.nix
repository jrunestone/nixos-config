{ pkgs, inputs, ... }: {
  imports = [
    (import ./disko-config.nix { disk = "/dev/sda"; })

    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    ../shared.nix
  ];

  networking = {
    hostName = "jr-vm";
  };

  system.stateVersion = "24.05";
}
