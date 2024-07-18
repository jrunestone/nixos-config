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
      ".nuget"
      ".pki"

      ".local/share/keyrings"
      ".local/share/containers"
      ".local/share/icons"
      ".local/share/NuGet"
      ".local/share/flatpak"

      # jetbrains
      ".java"
      ".local/share/JetBrains"
      ".config/JetBrains"
      ".cache/JetBrains"

      # spotify
      ".config/spotify"
      ".cache/spotify"

      # firefox
      ".cache/mozilla/firefox"
      "./.mozilla/firefox"

      # misc
      ".local/share/bottles"
      ".config/Notesnook"
      ".var/app/com.valvesoftware.Steam"
      ".config/Slack"
      ".config/1Password"
      ".config/Insomnia"

      # minecraft
      ".local/share/PrismLauncher"

      # vintage story
      ".config/VintagestoryData"
    ];

    files = [
      ".zsh_history"
    ];

    allowOther = true;
  };
}
