{ pkgs, inputs, ... }: {
  imports = [
    (import ../shared/disko-config.nix { disk = "/dev/nvme0n1"; })
    (import ./disko-config.nix { disk = "/dev/nvme1n1"; })

    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    ../shared
    ./features/system
  ];

  system.stateVersion = "24.05";
}
