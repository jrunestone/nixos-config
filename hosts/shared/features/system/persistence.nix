{ inputs, lib, pkgs, config, outputs, ... }: {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

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

  # create persisted dirs in home directory
  system.activationScripts.persistent-dirs.text =
    let
      mkHomePersist = user: lib.optionalString user.createHome ''
        mkdir -p /nix/persist/${user.home}
        chown ${user.name}:${user.group} /nix/persist/${user.home}
        chmod ${user.homeMode} /nix/persist/${user.home}
      '';
      users = lib.attrValues config.users.users;
    in
      lib.concatLines (map mkHomePersist users);
}
