{ inputs, lib, pkgs, config, outputs, ... }: {  
  home.persistence."/nix/persist/home/${config.home.username}" = {
    directories = [
      "Documents"
      "dev"
      ".gnupg"
      ".ssh"
      ".local/share/keyrings"
    ];

    files = [
      ".bash_history"
    ];

    allowOther = true;
  };
}