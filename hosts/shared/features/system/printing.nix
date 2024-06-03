{ inputs, lib, pkgs, config, outputs, ... }: {
  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
