{ inputs, lib, pkgs, config, outputs, ... }: {  
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home.persistence."/nix/persist/home/${config.home.username}" = {
    directories = [
      ".gnupg"
      ".ssh"
      ".local/share/keyrings"

      "Documents"
      "dev"

      # gradience
      ".config/presets/official"
      ".config/presets/curated"
      ".config/presets/user"
      ".config/gtk-4.0"

      # obsidian
      ".config/obsidian"

      # vivaldi
      ".config/vivaldi"
    ];

    files = [
      ".bash_history"
    ];

    allowOther = true;
  };
}