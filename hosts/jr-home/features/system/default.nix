{ pkgs, inputs, ... }: {
  hardware.bluetooth.enable = false;

  networking = {
    hostName = "jr-home";
  };
}
