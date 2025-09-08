{ pkgs, inputs, ... }: {
  hardware.bluetooth.enable = false;

  networking = {
    hostName = "jr-home";
  };

  services.flatpak.enable = true;

  # quemu
  virtualisation.spiceUSBRedirection.enable = true;
}
