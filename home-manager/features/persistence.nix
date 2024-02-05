{ inputs, lib, pkgs, config, outputs, ... }: {
  fileSystems."/nix".neededForBoot = true;
  programs.fuse.userAllowOther = true;
  
  environment.persistence."/nix/persist/home/${config.home.username}" = {
    hideMounts = true;

    directories = [
      "Documents"
      "dev"
      { directory = ".gnupg"; mode = "0700"; }
      { directory = ".ssh"; mode = "0700"; }
      { directory = ".local/share/keyrings"; mode = "0700"; }
    ];

    files = [
      ".bash_history"
    ];

    allowOther = true;
  };
}