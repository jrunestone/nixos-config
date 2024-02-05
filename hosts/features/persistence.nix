{ inputs, lib, pkgs, config, outputs, ... }: {
  fileSystems."/nix".neededForBoot = true;
  
  environment.persistence."/nix/persist/system" = {
    hideMounts = true;

    directories = [
      "/etc/nixos"
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
      { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
    ];

    files = [
      "/etc/machine-id"
    ];
  };
}