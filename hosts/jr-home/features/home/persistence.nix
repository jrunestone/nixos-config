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

      ".cache/hyprland"

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

      # zed
      ".config/zed"
      ".local/share/zed"

      # spotify
      ".config/spotify"
      ".cache/spotify"

      # firefox
      ".cache/mozilla/firefox"
      "./.mozilla/firefox"

      # minecraft
      ".local/share/PrismLauncher"

      # vintage story
      ".config/VintagestoryData"

      # qbittorrent
      ".config/qBittorrent"
      ".cache/qBittorrent"
      ".local/share/qBittorrent"

      # other
      ".local/share/bottles"
      ".config/Notesnook"
      ".var/app/com.valvesoftware.Steam"
      ".config/Slack"
      ".config/1Password"
      ".config/Insomnia"
    ];

    files = [
      ".zsh_history"
    ];

    allowOther = true;
  };
}
