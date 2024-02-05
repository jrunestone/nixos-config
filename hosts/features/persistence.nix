{ inputs, lib, pkgs, config, outputs, ... }: {
  fileSystems."/nix".neededForBoot = true;
  programs.fuse.userAllowOther = true;
  
  environment.persistence."/nix/persist/system" = {
    hideMounts = true;

    directories = [
      "/etc/nixos"
      "/etc/NetworkManager/system-connections"
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd"
      { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
    ];

    files = [
      "/etc/machine-id"
    ];
  };
}