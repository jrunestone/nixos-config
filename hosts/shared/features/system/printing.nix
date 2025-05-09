{ inputs, lib, pkgs, config, outputs, ... }: {
  # manage the printer from cups at localhost:631
  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
