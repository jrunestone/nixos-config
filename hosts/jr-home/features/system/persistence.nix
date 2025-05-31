{ inputs, lib, pkgs, config, outputs, ... }: {  
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  environment.persistence = {
    "/nix/persist/system" = {
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
  
    "/nix/persist".users.jr = {
      directories = [
        "Documents"
        "dev"

        ".gnupg"
        ".ssh"
        ".nuget"
        ".pki"
        ".devpod"

        ".cache/hyprland"

        ".local/share/keyrings"
        ".local/share/containers"
        ".local/share/icons"
        ".local/share/NuGet"
        ".local/share/flatpak"
        ".local/share/mkcert"

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
        ".config/Notesnook"
        ".var/app/com.valvesoftware.Steam"
        ".config/Slack"
        ".config/1Password"
        ".config/Insomnia"
      ];

      files = [
        ".zsh_history"
      ];
    };
  };
}
