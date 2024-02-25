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
      ".local/share/containers"
      ".local/share/JetBrains"

      ".config/obsidian"
      ".config/vivaldi"
      ".config/spotify"
      ".config/Slack"
      ".config/JetBrains"
      ".config/1Password"
      ".config/Insomnia"

      ".cache/Spotify"
      ".cache/JetBrains"
      ".cache/vivaldi"
    ];

    files = [
      ".bash_history"
    ];

    allowOther = true;
  };
}
