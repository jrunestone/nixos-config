{ pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../shared.nix
    ../features/wireless.nix
  ];

  networking = {
    hostName = "jr-work";
  };

  system.stateVersion = "24.05";
}
