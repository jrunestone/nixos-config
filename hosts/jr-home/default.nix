{ pkgs, inputs, ... }: {
  imports = [
    (import ../shared/disko-config.nix { disk = "/dev/nvme0n1"; })
    (import ./disko-config.nix { disk = "/dev/nvme1n1"; })

    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../shared
    ../shared/features/system/podman.nix
    ../shared/features/system/1password.nix

    ./features/system
    ./features/system/mounts.nix
    ./features/system/persistence.nix
    ./features/system/reverse-proxy.nix
  ];

  host-options.system = {
    autoLogin = true;
  };

  system.stateVersion = "24.05";
}
