{ inputs, lib, pkgs, config, outputs, ... }: {  
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home.persistence."/nix/persist/home/${config.home.username}" = {
    directories = [
      "Documents"
      "dev"
      ".gnupg"
      ".ssh"
      ".local/share/keyrings"
      ".config/presets"
      ".config/gtk3.0"
      ".config/gtk4.0"
    ];

    files = [
      ".bash_history"
    ];

    allowOther = true;
  };
}