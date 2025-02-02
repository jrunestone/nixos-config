{ pkgs, inputs, ... }: {
  hardware.bluetooth.enable = false;

  networking = {
    hostName = "jr-home";
  };

  # quemu
  virtualisation.spiceUSBRedirection.enable = true;
}
