{ inputs, lib, pkgs, config, outputs, ... }: {
  imports = [
    
  ];

  fileSystems."/nix".neededForBoot = true;
  programs.fuse.userAllowOther = true;
  
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
