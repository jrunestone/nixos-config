{ inputs, lib, pkgs, config, outputs, ... }: {
  virtualisation = {
    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = [
    pkgs.podman-compose
  ];
}
