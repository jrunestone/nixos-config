{ inputs, lib, pkgs, config, outputs, ... }: {
  virtualisation = {
    podman = {
      enable = true;
      autoPrune.enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    containers.storage.settings = {
      storage = {
        driver = "overlay";
      };
    };
  };

  environment.systemPackages = [
    pkgs.podman-compose
  ];
}
